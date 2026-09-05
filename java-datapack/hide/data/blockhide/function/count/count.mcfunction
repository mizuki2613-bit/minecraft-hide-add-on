execute unless items entity @s weapon.offhand clock[custom_data={"blockhide:transform_item":1b}] run return run function blockhide:count/reset
execute unless items entity @s weapon.mainhand #blockhide:transformable_blocks run return run function blockhide:count/reset

execute if predicate blockhide:is_moving run return run function blockhide:count/reset
execute unless predicate blockhide:is_on_ground run return run function blockhide:count/reset

scoreboard players add @s blockhide.count 1
