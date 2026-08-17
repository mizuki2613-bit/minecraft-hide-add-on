execute unless items entity @s weapon.offhand stick[custom_data={hide_stick:true}] run return run scoreboard players reset @s hide.countdown
execute unless items entity @s weapon.mainhand #hide:transformable_blocks run return run scoreboard players reset @s hide.countdown

execute if entity @s[scores={hide.walk=1..}] run return run scoreboard players reset @s hide.countdown
execute if entity @s[scores={hide.dash=1..}] run return run scoreboard players reset @s hide.countdown
execute if entity @s[scores={hide.crouch=1..}] run return run scoreboard players reset @s hide.countdown
execute if entity @s[nbt={OnGround:false}] run return run scoreboard players reset @s hide.countdown

scoreboard players add @s hide.countdown 1