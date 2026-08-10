execute unless items entity @s weapon.offhand stick[custom_data={hide_stick:true}] run return run scoreboard players set @s countdown 0
execute unless items entity @s weapon.mainhand #hide:transformable_blocks run return run scoreboard players set @s countdown 0

execute if entity @s[scores={hide.walk=1..}] run return run scoreboard players set @s hide.countdown 0
execute if entity @s[scores={hide.dash=1..}] run return run scoreboard players set @s hide.countdown 0
execute if entity @s[scores={hide.crouch=1..}] run return run scoreboard players set @s hide.countdown 0
execute if entity @s[nbt={OnGround:false}] run return run scoreboard players set @s hide.countdown 0

scoreboard players add @s hide.countdown 1