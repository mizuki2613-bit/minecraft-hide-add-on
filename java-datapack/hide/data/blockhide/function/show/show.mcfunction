advancement revoke @s only blockhide:hurt
execute unless entity @s[tag=blockhide.hiding] run return fail

setblock ~ ~ ~ air

# Restore items
execute align xyz positioned ~0.5 ~ ~0.5 run function blockhide:show/restore_items {target:"@n[tag=blockhide.vehicle,distance=0]",ignore:"potion[custom_data={blank:1b}]"}

# Reset player
attribute @s scale base reset
effect clear @s invisibility
team leave @s
tag @s remove blockhide.hiding

gamemode survival @s[scores={blockhide.gamemode=0}]
gamemode creative @s[scores={blockhide.gamemode=1}]
scoreboard players reset @s blockhide.gamemode
