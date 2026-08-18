execute unless items entity @s weapon.offhand stick[custom_data={hide_stick:true}] run return run function hide:reset_count
execute unless items entity @s weapon.mainhand #hide:transformable_blocks run return run function hide:reset_count

execute if entity @s[predicate=!hide:is_moving] run return run function hide:reset_count
execute if entity @s[predicate=!hide:is_on_ground] run return run function hide:reset_count

scoreboard players add @s hide.count 1