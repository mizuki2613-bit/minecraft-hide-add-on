#countdown & clear actionbar
execute as @a run function hide:count

#hiding
execute as @a[tag=hide.hiding] at @s run return run function hide:hiding

#hide
execute as @a if score @s hide.count >= HIDE_READY hide.count if predicate hide:can_hide at @s align xyz positioned ~0.5 ~ ~0.5 run function hide:hide

#actionbar
#To prevent the action bar from appearing every time there is a small movement, it will only be displayed when the countdown reaches 3 or higher.
execute as @a[scores={hide.count=3..}] at @s align xyz positioned ~0.5 ~ ~0.5 run function hide:actionbar