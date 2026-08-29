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
		// Anchorがまだロードされていない可能性があるので、
		// ここでは解除しない。
		return false;
	}

	const anchor = anchors[0];

	state.anchor = anchor;

	state.hidePosition = {
		x: Math.floor(anchor.location.x),
		y: Math.floor(anchor.location.y),
		z: Math.floor(anchor.location.z),
	};

	// ワールド再起動時に消えるEffectを再付与
	player.addEffect("invisibility", 10, {
		amplifier: 0,
		showParticles: false,
	});

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
	player.addEffect("invisibility", 10, {
		amplifier: 0,
		showParticles: false,
	});

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
