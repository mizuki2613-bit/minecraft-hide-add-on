import { world, system } from "@minecraft/server";
import { getState } from "./state.js";
import { isHoldingAllowedItem } from "./blocks.js";
import { blockPos, isSameBlock, setActionBar } from "./utils.js";
import { updateHiddenPlayer, restoreHideMode, start_hide } from "./hide.js";
import "./event.js";

const HIDE_READY = 50;
const BAR_LENGTH = 10;
const SHOW_BAR_THRESHOLD = 3;
const TICK_RATE = 2;
const COUNT_SPEED = 2;

system.runInterval(() => {
	const players = world.getPlayers();
	for (const player of players) {
		const playerId = player.id;
		const state = getState(playerId);
		const pos = player.location;
		const currentPos = blockPos(pos);
		const hiding = player.getProperty("hide:is_hiding");

		if (!state.lastPosition) state.lastPosition = pos;
		if (hiding) {
			if (!state.anchor?.isValid || !state.hidePosition) {
				restoreHideMode(player, state);
			}

			if (state.anchor?.isValid && state.hidePosition) {
				updateHiddenPlayer(player, state);
			}

			continue;
		}

		//隠れていないプレイヤーの処理
		const last = state.lastPosition;
		const lastBlock = blockPos(last);
		const isMoving = !isSameBlock(lastBlock, currentPos);
		state.lastPosition = pos;

		const isFloating = !player.isOnGround;
		const equippable = player.getComponent("equippable");
		const item = equippable?.getEquipment("Mainhand");
		const OffhandItem = equippable?.getEquipment("Offhand");
		const isAllowedMainhandItem = isHoldingAllowedItem(item);
		const isAllowedOffhandItem = OffhandItem?.typeId === "hide:mimic_block";

		if (
			isMoving ||
			isFloating ||
			!isAllowedMainhandItem ||
			!isAllowedOffhandItem
		) {
			state.countdown = 0;
			state.actionbar = null;
			continue;
		} else {
			state.countdown += COUNT_SPEED;
		}
		const count = state.countdown;
		if (count >= HIDE_READY) {
			// 隠れる処理
			const currentBlock = player.dimension.getBlock(currentPos);
			const standingBlock = currentBlock?.below();
			const headBlock = currentBlock?.above();
			const isBlocked = !currentBlock?.isAir;
			const isHeadBlocked = !headBlock?.isAir;
			const isStandingOnAir = standingBlock?.isAir;
			if (isBlocked || isHeadBlocked || isStandingOnAir) {
				if (isBlocked) {
					setActionBar(player, "hide.actionbar.error.1", true);
				} else if (isHeadBlocked) {
					setActionBar(player, "hide.actionbar.error.2", true);
				} else if (isStandingOnAir) {
					setActionBar(player, "hide.actionbar.error.3", true);
				}
				continue;
			}
			start_hide(player, state, currentPos, item);
		} else {
			// アクションバー
			if (count > SHOW_BAR_THRESHOLD) {
				const filled = Math.floor((count / HIDE_READY) * BAR_LENGTH);
				const bar =
					"§aO".repeat(filled) + "§8O".repeat(BAR_LENGTH - filled);
				setActionBar(player, bar, false);
			}
		}
	}
}, TICK_RATE);
