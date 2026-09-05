# Player setup
tag @s add blockhide.hiding
team join blockhide.hiding_team @s
scoreboard players reset @s blockhide.count
attribute @s scale base set 0
playsound block.composter.ready master @s ~ ~ ~
scoreboard players reset @s blockhide.gamemode
scoreboard players set @s[gamemode=survival] blockhide.gamemode 0
scoreboard players set @s[gamemode=creative] blockhide.gamemode 1

# Place block
$setblock ~ ~ ~ $(id)

# Mount
# Use a non-stackable item to prevent items from stacking.
summon villager ~ ~ ~ {NoAI:1b,Silent:1b,Invulnerable:1b,DeathTime:32767,Tags:[blockhide.vehicle],Team:"blockhide.hiding_team",active_effects:[{id:invisibility,duration:-1,show_particles:0b}],attributes:[{id:scale,base:0.4983},{id:max_health,base:0}],Inventory: [{id:"potion",components:{custom_data:{blank:1b}}},{id:"potion",components:{custom_data:{blank:1b}}},{id:"potion",components:{custom_data:{blank:1b}}},{id:"potion",components:{custom_data:{blank:1b}}},{id:"potion",components:{custom_data:{blank:1b}}}]}
ride @s mount @n[tag=blockhide.vehicle,distance=0]

# Store items
function blockhide:hide/store_items {store:"@n[tag=blockhide.vehicle,distance=0]"}

# Progress bar
function blockhide:progress_bar/5
