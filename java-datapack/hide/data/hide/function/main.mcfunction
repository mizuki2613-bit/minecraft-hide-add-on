#clear actionbar
title @a[scores={hide.countdown=1..,hide.walk=1..}] actionbar ""
title @a[scores={hide.countdown=1..,hide.dash=1..}] actionbar ""
title @a[scores={hide.countdown=1..,hide.crouch=1..}] actionbar ""
title @a[scores={hide.countdown=1..},nbt={OnGround:false}] actionbar ""

#check if can hide behind block
execute as @a run function hide:countdown

scoreboard players reset @a[scores={hide.walk=1..}] hide.walk
scoreboard players reset @a[scores={hide.dash=1..}] hide.dash
scoreboard players reset @a[scores={hide.crouch=1..}] hide.crouch

#hiding
execute as @a[tag=hiding] at @s run function hide:hiding

#hide
#~-0.00001 is the offset used to retrieve the block the player is standing on.

execute as @a if score @s hide.countdown >= HIDE_READY hide.countdown at @s align xyz positioned ~0.5 ~ ~0.5 if block ~ ~ ~ #air if block ~ ~1 ~ #air unless block ~ ~-0.00001 ~ #hide:not_full unless entity @n[tag=hide_block,distance=0] unless predicate hide:is_sneaking run function hide:hide

#actionbar
#To prevent the action bar from appearing every time there is a small movement, it will only be displayed when the countdown reaches 3 or higher.

execute as @a[scores={hide.countdown=3..}] at @s align xyz positioned ~0.5 ~ ~0.5 run function hide:progress_bar