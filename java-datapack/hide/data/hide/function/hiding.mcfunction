# You must ensure that you remain completely out of sight while hiding.
# Prevents cheating by hidden players.
gamemode adventure @s
effect give @s invisibility infinite 0 true

# Show
execute if block ~ ~ ~ #air run return run function hide:show/show
execute unless data entity @s {RootVehicle:{}} run function hide:show/show
