#show
execute if block ~ ~ ~ #air run function hide:show
execute unless entity @s[nbt={RootVehicle:{}}] run function hide:show

#prevent changes
gamemode adventure @s[tag=hide.hiding]
effect give @s[tag=hide.hiding] invisibility infinite 0 true