advancement revoke @s only hide:hurt
execute unless entity @s[tag=hiding] run return fail

#restore items
execute align xyz positioned ~0.5 ~ ~0.5 as @n[tag=hide_block,distance=0] run function hide:restore_items

#reset player
setblock ~ ~ ~ air
attribute @s scale base reset
effect clear @s invisibility
team leave @s
scoreboard players reset @s hide.hiding_time
tag @s remove hiding