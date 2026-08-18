#countdown & clear actionbar
execute as @a run function hide:count

scoreboard players reset @a[scores={hide.walk=1..}] hide.walk
scoreboard players reset @a[scores={hide.dash=1..}] hide.dash

#hiding
execute as @a[tag=hide.hiding] at @s run function hide:hiding

#hide
#~-0.00001 is the offset used to retrieve the block the player is standing on.
execute as @a if score @s hide.count >= HIDE_READY hide.count at @s align xyz positioned ~0.5 ~ ~0.5 if block ~ ~ ~ #air if block ~ ~1 ~ #air unless block ~ ~-0.00001 ~ #hide:not_full unless entity @n[tag=hide_block,distance=0] unless predicate hide:is_sneaking run function hide:hide

#actionbar
#To prevent the action bar from appearing every time there is a small movement, it will only be displayed when the countdown reaches 3 or higher.
execute as @a[scores={hide.count=3..}] at @s align xyz positioned ~0.5 ~ ~0.5 run function hide:actionbar