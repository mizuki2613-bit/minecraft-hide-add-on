import { getState } from "./state.js";

export function blockPos(pos) {
	return {
		x: Math.floor(pos.x),
		y: Math.floor(pos.y),
		z: Math.floor(pos.z),
	};
}

export function isSameBlock(last, current) {
	return last.x === current.x && last.y === current.y && last.z === current.z;
}

export function setActionBar(player, text, warning) {
	const state = getState(player.id);
	if (state.actionbar === text) return;

	state.actionbar = text;

	const message = {
		translate: text,
	};

	if (warning) {
		player.onScreenDisplay.setActionBar({
			rawtext: [{ text: "§c§l" }, message],
		});

		player.playSound("note.snare", {
			location: player.location,
			volume: 1,
			pitch: 1.0,
		});
	} else {
		player.onScreenDisplay.setActionBar(message);
	}
}
