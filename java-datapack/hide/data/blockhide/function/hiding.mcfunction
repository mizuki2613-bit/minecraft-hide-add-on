# You must ensure that you remain completely out of sight while hiding.
# Prevents cheating by hidden players.
gamemode adventure
effect give @s invisibility infinite 0 true

# Show
execute if block ~ ~ ~ #air run return run function blockhide:show/show
execute unless predicate blockhide:has_vehicle run function blockhide:show/show
