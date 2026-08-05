execute unless items entity @s weapon.offhand clock[custom_data={hide_stick:1b}] run return run scoreboard players set @s countdown 0
execute unless items entity @s weapon.mainhand #hide:transformable_blocks run return run scoreboard players set @s countdown 0

execute if entity @s[scores={walk=1..}] run return run scoreboard players set @s countdown 0
execute if entity @s[scores={dash=1..}] run return run scoreboard players set @s countdown 0
execute if entity @s[scores={crouch=1..}] run return run scoreboard players set @s countdown 0

execute if entity @s[nbt={OnGround:0b}] run return run scoreboard players set @s countdown 0

scoreboard players add @s countdown 1