# Prevent changes
gamemode adventure @s
effect give @s invisibility infinite 0 true

# Show
execute if block ~ ~ ~ #air run return run function hide:show
execute unless entity @s[nbt={RootVehicle:{}}] run function hide:show
