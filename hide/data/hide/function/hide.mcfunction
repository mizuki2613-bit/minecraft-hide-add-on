tag @s add hiding
scoreboard players set @s countdown 0
attribute @s scale base set 0.66666
effect give @s invisibility infinite 0 true

#place block
data modify storage hide:tmp item set from entity @s SelectedItem.id
function hide:place_block with storage hide:tmp
data remove storage hide:tmp item

#summon armor stand
summon armor_stand ~ ~ ~ {Invisible:1,NoGravity:1,Tags:["hide_block"],attributes:[{id:scale,base:0.3},{id:max_health,base:0}]}
ride @s mount @n[tag=hide_block,distance=0]

title @s actionbar {text:"█████",color:green}
playsound block.composter.ready master @s ~ ~ ~ 100