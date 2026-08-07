const copper_grates = new Set([
	"minecraft:copper_grate",
	"minecraft:exposed_copper_grate",
	"minecraft:weathered_copper_grate",
	"minecraft:oxidized_copper_grate",
	"minecraft:waxed_copper_grate",
	"minecraft:waxed_exposed_copper_grate",
	"minecraft:waxed_weathered_copper_grate",
	"minecraft:waxed_oxidized_copper_grate",
]);
const leaves = new Set([
	"minecraft:oak_leaves",
	"minecraft:spruce_leaves",
	"minecraft:birch_leaves",
	"minecraft:jungle_leaves",
	"minecraft:acacia_leaves",
	"minecraft:dark_oak_leaves",
	"minecraft:mangrove_leaves",
	"minecraft:cherry_leaves",
	"minecraft:azalea_leaves",
	"minecraft:flowering_azalea_leaves",
	"minecraft:pale_oak_leaves",
]);
const glass = new Set([
	"minecraft:glass",
	"minecraft:tinted_glass",
	"minecraft:white_stained_glass",
	"minecraft:orange_stained_glass",
	"minecraft:magenta_stained_glass",
	"minecraft:light_blue_stained_glass",
	"minecraft:yellow_stained_glass",
	"minecraft:lime_stained_glass",
	"minecraft:pink_stained_glass",
	"minecraft:gray_stained_glass",
	"minecraft:light_gray_stained_glass",
	"minecraft:cyan_stained_glass",
	"minecraft:purple_stained_glass",
	"minecraft:blue_stained_glass",
	"minecraft:brown_stained_glass",
	"minecraft:green_stained_glass",
	"minecraft:red_stained_glass",
	"minecraft:black_stained_glass",
]);
const copper_chests = new Set([
	"minecraft:copper_chest",
	"minecraft:exposed_copper_chest",
	"minecraft:weathered_copper_chest",
	"minecraft:oxidized_copper_chest",
	"minecraft:waxed_copper_chest",
	"minecraft:waxed_exposed_copper_chest",
	"minecraft:waxed_weathered_copper_chest",
	"minecraft:waxed_oxidized_copper_chest",
]);
const shulker_boxes = new Set([
	"minecraft:shulker_box",
	"minecraft:white_shulker_box",
	"minecraft:orange_shulker_box",
	"minecraft:magenta_shulker_box",
	"minecraft:light_blue_shulker_box",
	"minecraft:yellow_shulker_box",
	"minecraft:lime_shulker_box",
	"minecraft:pink_shulker_box",
	"minecraft:gray_shulker_box",
	"minecraft:light_gray_shulker_box",
	"minecraft:cyan_shulker_box",
	"minecraft:purple_shulker_box",
	"minecraft:blue_shulker_box",
	"minecraft:brown_shulker_box",
	"minecraft:green_shulker_box",
	"minecraft:red_shulker_box",
	"minecraft:black_shulker_box",
]);
const anvils = new Set([
	"minecraft:anvil",
	"minecraft:chipped_anvil",
	"minecraft:damaged_anvil",
	"minecraft:deprecated_anvil",
]);

const redstone = new Set([
	"minecraft:piston",
	"minecraft:sticky_piston",
	"minecraft:redstone_block",
	"minecraft:note_block",
	"minecraft:target",
	"minecraft:dispenser",
	"minecraft:dropper",
]);

const natural = new Set([
	...leaves,
	"minecraft:reinforced_deepslate",
	"minecraft:honey_block",
	"minecraft:slime_block",
	"minecraft:bookshelf",
	"minecraft:decorated_pot",
	"minecraft:mangrove_roots",
	"minecraft:potent_sulfur",
	"minecraft:gravel",
	"minecraft:farmland",
	"minecraft:dirt_path",
	"minecraft:bedrock",
	"minecraft:sculk",
	"minecraft:sculk_catalyst",
	"minecraft:budding_amethyst",
	"minecraft:ice",
	"minecraft:bee_nest",
	"minecraft:chorus_plant",
	"minecraft:chorus_flower",
]);

const functional = new Set([
	...copper_chests,
	...shulker_boxes,
	...anvils,
	"minecraft:crafting_table",
	"minecraft:cartography_table",
	"minecraft:fletching_table",
	"minecraft:smithing_table",
	"minecraft:loom",
	"minecraft:furnace",
	"minecraft:smoker",
	"minecraft:blast_furnace",
	"minecraft:crafter",
	"minecraft:jukebox",
	"minecraft:beehive",
	"minecraft:lodestone",
	"minecraft:chiseled_bookshelf",
	"minecraft:chest",
	"minecraft:trapped_chest",
	"minecraft:ender_chest",
	"minecraft:barrel",
]);

const operatorUtility = new Set([
	"minecraft:command_block",
	"minecraft:chain_command_block",
	"minecraft:repeating_command_block",
	"minecraft:structure_block",
	"minecraft:jigsaw",
]);

const food = new Set(["minecraft:cake"]);

const ALLOWED_ITEMS = new Set([
	...glass,
	...natural,
	...functional,
	...redstone,
	...operatorUtility,
	...food,
	...copper_grates,
]);

const ALLOWED_TAGS = new Set([
	"minecraft:sulfur_cube_archetype_bouncy",
	"minecraft:sulfur_cube_archetype_explosive",
	"minecraft:sulfur_cube_archetype_slow_bouncy",
	"minecraft:sulfur_cube_archetype_slow_flat",
	"minecraft:sulfur_cube_archetype_fast_flat",
	"minecraft:sulfur_cube_archetype_light",
	"minecraft:sulfur_cube_archetype_fast_sliding",
	"minecraft:sulfur_cube_archetype_regular",
	"minecraft:sulfur_cube_archetype_slow_sliding",
	"minecraft:sulfur_cube_archetype_sticky",
	"minecraft:sulfur_cube_archetype_high_resistance",
	"minecraft:sulfur_cube_archetype_hot",
	"minecraft:sand",
]);

export function isHoldingAllowedItem(item) {
	if (!item) return false;

	if (ALLOWED_ITEMS.has(item.typeId)) {
		return true;
	}

	return item.getTags().some((tag) => ALLOWED_TAGS.has(tag));
}
