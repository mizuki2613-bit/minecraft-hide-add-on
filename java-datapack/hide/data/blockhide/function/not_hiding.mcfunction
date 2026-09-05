# Count & Clear actionbar
function blockhide:count/count

# Hide
execute if score @s blockhide.count >= HIDE_READY blockhide.count if predicate blockhide:can_hide run return run function blockhide:hide/hide with entity @s SelectedItem

# Show actionbar
# Show actionbar only when countdown >= 3.
execute if score @s blockhide.count matches 3.. run function blockhide:count/actionbar
