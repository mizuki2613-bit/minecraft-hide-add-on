tag @s add hiding
scoreboard players set @s countdown 0
attribute @s scale base set 0
effect give @s invisibility infinite 0 true
team join hide @s

#place block
data modify storage hide:tmp item set from entity @s SelectedItem.id
function hide:place_block with storage hide:tmp
data remove storage hide:tmp item

#summon vehicle
summon villager ~ ~ ~ {NoAI:1,Silent:1,Invulnerable:1,DeathTime:10000,Tags:["hide_block"],active_effects:[{id:invisibility,duration:-1,show_particles:0}],attributes:[{id:scale,base:0.4817307442426682},{id:max_health,base:0}],Inventory: [{id:potion,components:{custom_data:{item_fill:1}}},{id:potion,components:{custom_data:{item_fill:1}}},{id:potion,components:{custom_data:{item_fill:1}}},{id:potion,components:{custom_data:{item_fill:1}}},{id:potion,components:{custom_data:{item_fill:1}}}]}
ride @s mount @n[tag=hide_block,distance=0]

title @s actionbar {text:"█████",color:green}
playsound block.composter.ready master @s ~ ~ ~ 100

execute on vehicle run function hide:store_items