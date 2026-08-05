advancement revoke @s only hide:hurt
execute unless entity @s[tag=hiding] run return fail

tag @s remove hiding
attribute @s scale base reset
effect clear @s invisibility
team leave @s
scoreboard players reset @s hiding_time

execute align xyz positioned ~0.5 ~ ~0.5 as @e[tag=hide_block,distance=0] run function hide:show_block