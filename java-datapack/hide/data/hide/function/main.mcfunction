# Handle hiding
execute as @a[tag=hide.hiding] at @s run function hide:hiding

# Handle not hiding
execute as @a[tag=!hide.hiding] at @s align xyz positioned ~0.5 ~ ~0.5 run function hide:not_hiding
