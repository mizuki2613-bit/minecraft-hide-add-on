# Count & Clear actionbar
function hide:count_hiding

# Hide
execute if score @s hide.count >= HIDE_READY hide.count if predicate hide:can_hide run return run function hide:hide/hide

# Show actionbar
#Show actionbar only when countdown >= 3.
execute if score @s hide.count matches 3.. run function hide:actionbar
