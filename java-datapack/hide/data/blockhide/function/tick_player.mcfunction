# Handle hiding
execute if entity @s[tag=blockhide.hiding] run return run function blockhide:hiding

# Handle not hiding
execute align xyz positioned ~0.5 ~ ~0.5 run function blockhide:not_hiding
