advancement revoke @s only hide:hurt
execute unless entity @s[tag=hiding] run return fail

tag @s remove hiding
attribute @s scale base reset
effect clear @s invisibility

setblock ~ ~ ~ air
execute align xyz positioned ~0.5 ~ ~0.5 run kill @e[tag=hide_block,distance=0]