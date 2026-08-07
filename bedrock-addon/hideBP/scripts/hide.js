import { getState } from "./state.js";

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
	//アンカーが削除された
	const anchor = state.anchor;
	if (!anchor || !anchor.isValid) {
		leaveHideMode(player);
		return;
	}
	//アンカーから降りた
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
	//ブロックが破壊された
	const hidePos = state.hidePosition;
	if (hidePos) {
		const block = player.dimension.getBlock(hidePos);
		if (!block || block.isAir) {
			leaveHideMode(player);
			return;
		}
	}
}
