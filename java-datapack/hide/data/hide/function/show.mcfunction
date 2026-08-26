advancement revoke @s only hide:hurt
execute unless entity @s[tag=hide.hiding] run return fail

setblock ~ ~ ~ air

# Restore items
execute align xyz positioned ~0.5 ~ ~0.5 run function hide:restore_items {target:"@n[tag=hide.vehicle,distance=0]",ignore:"minecraft:potion[custom_data={blank:1b}]"}

# Reset player
attribute @s scale base reset
effect clear @s invisibility
team leave @s
tag @s remove hide.hiding

gamemode survival @s[scores={hide.gamemode=0}]
gamemode creative @s[scores={hide.gamemode=1}]
scoreboard players reset @s hide.gamemode
