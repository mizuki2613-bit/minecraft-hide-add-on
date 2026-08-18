# Restore equipment
$execute unless items entity $(target) mob.inventory.0 barrier[custom_data={blank:1}] run item replace entity @s armor.head from entity $(target) mob.inventory.0
$execute unless items entity $(target) mob.inventory.1 barrier[custom_data={blank:1}] run item replace entity @s armor.chest from entity $(target) mob.inventory.1
$execute unless items entity $(target) mob.inventory.2 barrier[custom_data={blank:1}] run item replace entity @s armor.legs from entity $(target) mob.inventory.2
$execute unless items entity $(target) mob.inventory.3 barrier[custom_data={blank:1}] run item replace entity @s armor.feet from entity $(target) mob.inventory.3

# Restore offhand
$execute unless items entity $(target) mob.inventory.4 barrier[custom_data={blank:1}] run item replace entity @s weapon.offhand from entity $(target) mob.inventory.4

# Restore mainhand
$execute unless items entity $(target) mob.inventory.5 barrier[custom_data={blank:1}] run summon item ~ ~ ~ {Tags:[hide.drop_mainhand],Item:{id:stone}}

$data modify entity @n[tag=hide.drop_mainhand,distance=0] Item set from entity $(target) Inventory[5]

# Remove vehicle
$kill $(target)