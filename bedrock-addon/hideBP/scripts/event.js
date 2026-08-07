import { world, system, Player, ItemStack } from "@minecraft/server";
import { getState, deleteState } from "./state.js";
import { leaveHideMode } from "./hide.js";

const mimic_block_lore = [
	"§7メインハンドにブロック、",
	"§7オフハンドにこのアイテムを持つと",
	"§7ブロックに変身できます。",
];

function setMimicBlockLore(item) {
	if (!item || item.typeId !== "hide:mimic_block") return false;
	const lore = item.getLore();
	if (lore && lore.length > 0) return false;
	item.setLore(mimic_block_lore);
	return true;
}

world.afterEvents.playerInventoryItemChange.subscribe((event) => {
	const inventory = event.player.getComponent("inventory")?.container;
	if (inventory) {
		const item = inventory.getItem(event.slot);
		if (setMimicBlockLore(item)) {
			inventory.setItem(event.slot, item);
		}
	}
});

world.afterEvents.playerLeave.subscribe((event) => {
	const playerId = event.playerId;
	const state = getState(playerId);
	if (state.anchor?.isValid) state.anchor.remove();
	deleteState(playerId);
});

world.afterEvents.entityHurt.subscribe((event) => {
	if (event.hurtEntity instanceof Player) leaveHideMode(event.hurtEntity);
});

world.afterEvents.playerSpawn.subscribe((event) => {
	if (!event.initialSpawn) leaveHideMode(event.player);
});

world.afterEvents.entityHitBlock.subscribe((event) => {
	const player = event.damagingEntity;
	const block = event.hitBlock;
	if (!(player instanceof Player)) return;
	if (player.getProperty("hide:is_hiding")) return;
	const anchors = block.dimension.getEntities({
		location: {
			x: block.location.x + 0.5,
			y: block.location.y,
			z: block.location.z + 0.5,
		},
		maxDistance: 0.2,
		type: "hide:anchor",
	});
	if (anchors.length > 0) block.setType("minecraft:air");
});
