#Restore equipment
execute unless items entity @s mob.inventory.0 potion[custom_data={item_fill:1}] run item replace entity @p[tag=hide.hiding] armor.head from entity @s mob.inventory.0
execute unless items entity @s mob.inventory.1 potion[custom_data={item_fill:1}] run item replace entity @p[tag=hide.hiding] armor.chest from entity @s mob.inventory.1
execute unless items entity @s mob.inventory.2 potion[custom_data={item_fill:1}] run item replace entity @p[tag=hide.hiding] armor.legs from entity @s mob.inventory.2
execute unless items entity @s mob.inventory.3 potion[custom_data={item_fill:1}] run item replace entity @p[tag=hide.hiding] armor.feet from entity @s mob.inventory.3

#Restore offhand
execute unless items entity @s mob.inventory.4 potion[custom_data={item_fill:1}] run item replace entity @p[tag=hide.hiding] weapon.offhand from entity @s mob.inventory.4

#Restore mainhand
execute unless items entity @s mob.inventory.5 potion[custom_data={item_fill:1}] at @p[tag=hide.hiding] run summon item ~ ~ ~ {Tags:[hide.drop_mainhand],PickupDealy:0,Item:{id:stone}}
data modify entity @n[type=item,tag=hide.drop_mainhand] Item set from entity @s Inventory[5]

#other
kill @s