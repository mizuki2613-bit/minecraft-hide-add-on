import { world, system, Player } from "@minecraft/server";
import { getState } from "./state.js";
import { isHoldingAllowedItem } from "./blocks.js";
import { blockPos, isSameBlock, setActionBar } from "./utils.js";
import { updateHiddenPlayer, restoreHideMode } from "./hide.js";
import "./event.js";

const HIDE_READY = 25;
const BAR_LENGTH = 6;
const SHOW_BAR_THRESHOLD = 3;
const TICK_RATE = 1;
const COUNT_SPEED = 0.5;

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
		const item = player
			.getComponent("equippable")
			?.getEquipment("Mainhand");
		const OffhandItem = player
			.getComponent("equippable")
			?.getEquipment("Offhand");
		const isHoldingAllowedBlock = isHoldingAllowedItem(item);
		const isHoldingAllowedMimicItem =
			OffhandItem?.typeId === "hide:mimic_block";

		if (
			isMoving ||
			isFloating ||
			!isHoldingAllowedBlock ||
			!isHoldingAllowedMimicItem
		) {
			state.countdown = 0;
			state.actionbar = null;
			continue;
		} else {
			state.countdown += COUNT_SPEED;
		}
		const count = state.countdown;
		if (count >= HIDE_READY) {
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
		} else {
			if (count > SHOW_BAR_THRESHOLD) {
				const filled = Math.floor((count / HIDE_READY) * BAR_LENGTH);
				const bar =
					"§a〇".repeat(filled) + "§8〇".repeat(BAR_LENGTH - filled);
				setActionBar(player, bar, false);
			}
		}
	}
}, TICK_RATE);
