import { getState } from "./state.js";

export function restoreHideMode(player, state) {
	if (!player.getProperty("hide:is_hiding")) return false;

	// 既に復元済み
	if (state.anchor?.isValid && state.hidePosition) {
		return true;
	}

	const anchors = player.dimension.getEntities({
		location: player.location,
		maxDistance: 2,
		type: "hide:anchor",
	});

	if (anchors.length === 0) {
		// Anchorがまだロードされていない可能性があるのでここでは解除しない。
		return false;
	}

	const anchor = anchors[0];

	state.anchor = anchor;

	state.hidePosition = {
		x: Math.floor(anchor.location.x),
		y: Math.floor(anchor.location.y),
		z: Math.floor(anchor.location.z),
	};

	// プレイヤーがAnchorから降りていた場合に再搭乗
	const rideable = anchor.getComponent("minecraft:rideable");
	if (rideable) {
		const riders = rideable.getRiders() ?? [];
		const isRiding = riders.some((rider) => rider.id === player.id);

		if (!isRiding) {
			try {
				rideable.addRider(player);
			} catch (error) {
				console.warn(`Failed to restore rider: ${error}`);
			}
		}
	}

	return true;
}

export function leaveHideMode(player) {
	if (!player.getProperty("hide:is_hiding")) return;
	const state = getState(player.id);

	player.removeEffect("invisibility");
	player.setProperty("hide:is_hiding", false);

	if (state.anchor?.isValid) state.anchor.remove();

	if (state.hidePosition) {
		player.dimension.setBlockType(state.hidePosition, "minecraft:air");
	}

	state.anchor = null;
	state.hidePosition = null;
	state.countdown = 0;
	state.actionbar = null;
}

export function updateHiddenPlayer(player, state) {
	player.addEffect("invisibility", 5, { amplifier: 0, showParticles: false });

	// アンカーが削除された
	const anchor = state.anchor;
	if (!anchor || !anchor.isValid) {
		leaveHideMode(player);
		return;
	}

	// アンカーから降りた
	const rideable = anchor.getComponent("minecraft:rideable");
	if (!rideable) {
		leaveHideMode(player);
		return;
	}

	const riders = rideable.getRiders() ?? [];
	const isStillRiding = riders.some((r) => r.id === player.id);

	if (!isStillRiding) {
		leaveHideMode(player);
		return;
	}

	// ブロックが破壊された
	const hidePos = state.hidePosition;

	if (hidePos) {
		const block = player.dimension.getBlock(hidePos);

		if (!block || block.isAir) {
			leaveHideMode(player);
			return;
		}
	}
}

export function start_hide(player, state, currentPos, item) {
	state.countdown = 0;
	player.setProperty("hide:is_hiding", true);
	state.hidePosition = currentPos;
	player.dimension.setBlockType(currentPos, item.typeId);
	//アンカーをスポーンしてプレイヤーを乗せる
	const anchor = player.dimension.spawnEntity("hide:anchor", {
		x: currentPos.x + 0.5,
		y: currentPos.y,
		z: currentPos.z + 0.5,
	});
	const rideable = anchor.getComponent("minecraft:rideable");
	rideable?.addRider(player);
	state.anchor = anchor;
	player.playSound("block.composter.ready", {
		location: player.location,
		volume: 1,
		pitch: 1.0,
	});
}
