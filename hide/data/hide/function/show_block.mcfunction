#Restore equipment
item replace entity @p[tag=hiding] armor.head from entity @s mob.inventory.0
item replace entity @p[tag=hiding] armor.chest from entity @s mob.inventory.1
item replace entity @p[tag=hiding] armor.legs from entity @s mob.inventory.2
item replace entity @p[tag=hiding] armor.feet from entity @s mob.inventory.3

#Restore offhand
item replace entity @p[tag=hiding] weapon.offhand from entity @s mob.inventory.4

#Restore mainhand
execute unless items entity @s mob.inventory.0 clock[custom_data={hide_stick:1b}] at @p[tag=hiding] run summon item ~ ~ ~ {Tags:[drop_mainhand_item],PickupDealy:10,Item:{id:stone}}
data modify entity @n[type=item,tag=drop_mainhand_item] Item set from entity @s Inventory[5]

#other process
setblock ~ ~ ~ air
kill @s