import { world, system, Player } from "@minecraft/server";
import { getState } from "./state.js";
import { isHoldingAllowedItem } from "./blocks.js";
import { blockPos, isSameBlock, setActionBar } from "./utils.js";
import { updateHiddenPlayer } from "./hide.js";
import "./event.js";

const HIDE_READY = 25;
const DEFAULT_BLOCK = "minecraft:grass_block";
const BAR_LENGTH = 6;
const SHOW_BAR_THRESHOLD = 3;
const TICK_RATE = 5;
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
			updateHiddenPlayer(player, state);
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
			const currentBlock = player.dimension.getBlock(currentPos);
			const standingBlock = currentBlock?.below();
			const headBlock = currentBlock?.above();
			const isBlocked = !currentBlock?.isAir;
			const isHeadBlocked = !headBlock?.isAir;
			const isStandingOnAir = standingBlock?.isAir;
			if (isBlocked || isHeadBlocked || isStandingOnAir) {
				state.countdown = 0;
				if (isBlocked) {
					setActionBar(player, "ここには隠れられません", true);
				} else if (isHeadBlocked) {
					setActionBar(player, "頭上がふさがっています", true);
				} else if (isStandingOnAir) {
					setActionBar(player, "地面に立ってください", true);
				}
				continue;
			}
			state.countdown += COUNT_SPEED;
		}
		const count = state.countdown;
		if (count >= HIDE_READY) {
			state.countdown = 0;
			player.setProperty("hide:is_hiding", true);
			state.hidePosition = currentPos;
			try {
				player.dimension.setBlockType(currentPos, item.typeId);
			} catch {
				console.error("アイテムIDを取得できませんでした。");
				player.dimension.setBlockType(currentPos, DEFAULT_BLOCK);
			}
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
					"§a█".repeat(filled) + "§8█".repeat(BAR_LENGTH - filled);
				setActionBar(player, bar, false);
			}
		}
	}
}, TICK_RATE);
