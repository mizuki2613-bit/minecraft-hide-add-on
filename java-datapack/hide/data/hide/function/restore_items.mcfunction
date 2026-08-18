# Restore equipment
$execute unless items entity $(target) mob.inventory.0 $(ignore) run item replace entity @s armor.head from entity $(target) mob.inventory.0
$execute unless items entity $(target) mob.inventory.1 $(ignore) run item replace entity @s armor.chest from entity $(target) mob.inventory.1
$execute unless items entity $(target) mob.inventory.2 $(ignore) run item replace entity @s armor.legs from entity $(target) mob.inventory.2
$execute unless items entity $(target) mob.inventory.3 $(ignore) run item replace entity @s armor.feet from entity $(target) mob.inventory.3

#Restore offhand
execute unless items entity @s mob.inventory.4 barrier[custom_data={blank:1}] run item replace entity @p[tag=hide.hiding] weapon.offhand from entity @s mob.inventory.4

# Restore mainhand
$execute unless items entity $(target) mob.inventory.5 $(ignore) run summon item ~ ~ ~ {Tags:[hide.drop_mainhand],Item:{id:stone}}
$data modify entity @n[tag=hide.drop_mainhand,distance=0] Item set from entity $(target) Inventory[5]

# Remove vehicle
$kill $(target)
# Remove vehicle
$kill $(target)