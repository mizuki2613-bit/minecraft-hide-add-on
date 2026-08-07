execute if items entity @p[tag=hiding] armor.head * run item replace entity @s mob.inventory.0 from entity @p[tag=hiding] armor.head
execute if items entity @p[tag=hiding] armor.chest * run item replace entity @s mob.inventory.1 from entity @p[tag=hiding] armor.chest
execute if items entity @p[tag=hiding] armor.legs * run item replace entity @s mob.inventory.2 from entity @p[tag=hiding] armor.legs
execute if items entity @p[tag=hiding] armor.feet * run item replace entity @s mob.inventory.3 from entity @p[tag=hiding] armor.feet
execute if items entity @p[tag=hiding] weapon.offhand * run item replace entity @s mob.inventory.4 from entity @p[tag=hiding] weapon.offhand
execute if items entity @p[tag=hiding] weapon.mainhand * run item replace entity @s mob.inventory.5 from entity @p[tag=hiding] weapon.mainhand

item replace entity @p[tag=hiding] armor.head with air
item replace entity @p[tag=hiding] armor.chest with air
item replace entity @p[tag=hiding] armor.legs with air
item replace entity @p[tag=hiding] armor.feet with air
item replace entity @p[tag=hiding] weapon.offhand with air
item replace entity @p[tag=hiding] weapon.mainhand with air