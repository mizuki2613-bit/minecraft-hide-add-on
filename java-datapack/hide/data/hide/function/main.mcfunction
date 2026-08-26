# Count & Clear actionbar
execute as @a run function hide:count_hiding

# Handle hiding
execute as @a[tag=hide.hiding] at @s run function hide:hiding

# Hide
execute as @a[tag=!hide.hiding] at @s align xyz positioned ~0.5 ~ ~0.5 if score @s hide.count >= HIDE_READY hide.count if predicate hide:can_hide run function hide:hide

# Show actionbar
#Show actionbar only when countdown >= 3.
execute as @a[tag=!hide.hiding,scores={hide.count=3..}] at @s align xyz positioned ~0.5 ~ ~0.5 run function hide:actionbar
