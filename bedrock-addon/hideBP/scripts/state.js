const playerState = new Map();
export function getState(playerId) {
	let state = playerState.get(playerId);
	if (!state) {
		state = {
			countdown: 0,
			lastPosition: null,
			hidePosition: null,
			anchor: null,
			actionbar: null,
		};
		playerState.set(playerId, state);
	}
	return state;
}

export function deleteState(playerId) {
	playerState.delete(playerId);
}
