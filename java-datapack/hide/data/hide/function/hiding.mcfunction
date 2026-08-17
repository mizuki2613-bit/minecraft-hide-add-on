#show
execute if block ~ ~ ~ #air run function hide:show
execute unless entity @s[nbt={RootVehicle:{}}] run function hide:show

#sound
scoreboard players add @s[tag=hiding] hide.hiding_time 1
execute if entity @s[scores={hide.hiding_time=25..}] run playsound block.sculk_sensor.clicking master @a ~ ~ ~ 100 0.75 1
execute if entity @s[scores={hide.hiding_time=25..}] run scoreboard players reset @s hide.hiding_time
execute if entity @s[scores={hide.hiding_time=10}] run particle minecraft:dust{color:[0.5,0.5,0.5],scale:1} ~ ~ ~ 0.5 0.5 0.5 0 50 force
execute unless items entity @s weapon.mainhand * unless items entity @s weapon.offhand * run scoreboard players reset @s hide.hiding_time

#gamemode
gamemode adventure @s[tag=hiding]