#player setup
tag @s add hide.hiding
team join hide.hiding_team @s
scoreboard players reset @s hide.count
attribute @s scale base set 0
effect give @s invisibility infinite 0 true
title @s actionbar {text:"█████",color:green}
playsound block.composter.ready master @s ~ ~ ~
scoreboard players reset @s hide.gamemode
scoreboard players set @s[gamemode=survival] hide.gamemode 0
scoreboard players set @s[gamemode=creative] hide.gamemode 1

# Place block
data modify storage hide:tmp item set from entity @s SelectedItem.id
function hide:place_block with storage hide:tmp
data remove storage hide:tmp item

# Mount
# Use a non-stackable item to prevent items from stacking.
summon villager ~ ~ ~ {NoAI:1,Silent:1,Invulnerable:1,DeathTime:10000,Tags:[hide.vehicle],Team:"hide.hiding_team",active_effects:[{id:invisibility,duration:-1,show_particles:0}],attributes:[{id:scale,base:0.4983},{id:max_health,base:0}],Inventory: [{id:potion,components:{custom_data:{blank:1}}},{id:potion,components:{custom_data:{blank:1}}},{id:potion,components:{custom_data:{blank:1}}},{id:potion,components:{custom_data:{blank:1}}},{id:potion,components:{custom_data:{blank:1}}}]}
ride @s mount @n[tag=hide.vehicle,distance=0]

# Store items
function hide:store_items {store:"@n[tag=hide.vehicle,distance=0]"}
