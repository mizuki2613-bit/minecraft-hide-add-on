tag @s add hiding
scoreboard players set @s countdown 0
attribute @s scale base set 0
effect give @s invisibility infinite 0 true
team join hide @s

#place block
data modify storage hide:tmp item set from entity @s SelectedItem.id
function hide:place_block with storage hide:tmp
data remove storage hide:tmp item

#summon armor stand
summon villager ~ ~ ~ {NoAI:1,Silent:1,Invulnerable:1,DeathTime:10000,Tags:["hide_block"],active_effects:[{id:invisibility,duration:-1,show_particles:0}],attributes:[{id:scale,base:0.4817307442426682},{id:max_health,base:0}],Inventory: [{id:clock,components:{custom_data:{item_fill:1}}},{id:clock,components:{custom_data:{item_fill:1}}},{id:clock,components:{custom_data:{item_fill:1}}},{id:clock,components:{custom_data:{item_fill:1}}},{id:clock,components:{custom_data:{item_fill:1}}}]}
ride @s mount @n[tag=hide_block,distance=0]

title @s actionbar {text:"█████",color:green}
playsound block.composter.ready master @s ~ ~ ~ 100

execute on vehicle run item replace entity @s mob.inventory.0 from entity @p armor.head
execute on vehicle run item replace entity @s mob.inventory.1 from entity @p armor.chest
execute on vehicle run item replace entity @s mob.inventory.2 from entity @p armor.legs
execute on vehicle run item replace entity @s mob.inventory.3 from entity @p armor.feet
execute on vehicle run item replace entity @s mob.inventory.4 from entity @p weapon.offhand
execute on vehicle run item replace entity @s mob.inventory.5 from entity @p weapon.mainhand

item replace entity @s armor.head with air
item replace entity @s armor.chest with air
item replace entity @s armor.legs with air
item replace entity @s armor.feet with air
item replace entity @s weapon.offhand with air
item replace entity @s weapon.mainhand with air