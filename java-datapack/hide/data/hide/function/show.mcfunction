advancement revoke @s only hide:hurt
execute unless entity @s[tag=hide.hiding] run return fail

#restore items
execute align xyz positioned ~0.5 ~ ~0.5 run function hide:restore_items {target:"@n[tag=hide.vehicle,distance=0]"}

#reset player
setblock ~ ~ ~ air
attribute @s scale base reset
effect clear @s invisibility
team leave @s
scoreboard players reset @s hide.hiding_time
tag @s remove hide.hiding

gamemode survival @s[scores={hide.gamemode=0}]
gamemode creative @s[scores={hide.gamemode=1}]
scoreboard players reset @s hide.gamemode