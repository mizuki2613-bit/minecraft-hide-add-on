execute if items entity @p[tag=hide.hiding] armor.head * run item replace entity @s mob.inventory.0 from entity @p[tag=hide.hiding] armor.head
execute if items entity @p[tag=hide.hiding] armor.chest * run item replace entity @s mob.inventory.1 from entity @p[tag=hide.hiding] armor.chest
execute if items entity @p[tag=hide.hiding] armor.legs * run item replace entity @s mob.inventory.2 from entity @p[tag=hide.hiding] armor.legs
execute if items entity @p[tag=hide.hiding] armor.feet * run item replace entity @s mob.inventory.3 from entity @p[tag=hide.hiding] armor.feet
execute if items entity @p[tag=hide.hiding] weapon.offhand * run item replace entity @s mob.inventory.4 from entity @p[tag=hide.hiding] weapon.offhand
execute if items entity @p[tag=hide.hiding] weapon.mainhand * run item replace entity @s mob.inventory.5 from entity @p[tag=hide.hiding] weapon.mainhand

item replace entity @p[tag=hide.hiding] armor.head with air
item replace entity @p[tag=hide.hiding] armor.chest with air
item replace entity @p[tag=hide.hiding] armor.legs with air
item replace entity @p[tag=hide.hiding] armor.feet with air
item replace entity @p[tag=hide.hiding] weapon.offhand with air
item replace entity @p[tag=hide.hiding] weapon.mainhand with air