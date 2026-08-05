#clear actionbar
title @a[scores={countdown=1..,walk=1..}] actionbar ""
title @a[scores={countdown=1..,dash=1..}] actionbar ""
title @a[scores={countdown=1..,crouch=1..}] actionbar ""
title @a[scores={countdown=1..},nbt={OnGround:0b}] actionbar ""

#check if can hide behind block
execute as @a run function hide:countdown

scoreboard players set @a[scores={walk=1..}] walk 0
scoreboard players set @a[scores={dash=1..}] dash 0
scoreboard players set @a[scores={crouch=1..}] crouch 0

#show
execute as @a[tag=hiding] at @s unless items entity @s weapon.offhand clock[custom_data={hide_stick:1b}] run function hide:show
execute as @a[tag=hiding] at @s if block ~ ~ ~ #air run function hide:show
execute as @a[tag=hiding] at @s unless entity @s[nbt={RootVehicle:{}}] run function hide:show

#hide
#~-0.00001 is the offset used to retrieve the block the player is standing on.
execute as @a if score @s countdown >= HIDE_READY countdown at @s align xyz positioned ~0.5 ~ ~0.5 if block ~ ~ ~ #air if block ~ ~1 ~ #air unless block ~ ~-0.00001 ~ #hide:not_full unless entity @n[tag=hide_block,distance=0] unless predicate hide:is_sneaking run function hide:hide

#actionbar
#To prevent the action bar from appearing every time there is a small movement, it will only be displayed when the countdown reaches 3 or higher.
execute as @a[scores={countdown=3..}] at @s align xyz positioned ~0.5 ~ ~0.5 run function hide:progress_bar