#show
execute if block ~ ~ ~ #air run function hide:show
execute unless entity @s[nbt={RootVehicle:{}}] run function hide:show
scoreboard players add @s hiding_time 1
execute if entity @s[scores={hiding_time=25..}] run playsound block.sculk_sensor.clicking master @a ~ ~ ~ 0.5 0.75
execute if entity @s[scores={hiding_time=25..}] run scoreboard players reset @s hiding_time 