# Store equipment
execute on passengers if items entity @s armor.head * run item replace entity @n[tag=hide.vehicle,distance=0] mob.inventory.0 from entity @s armor.head
execute on passengers if items entity @s armor.chest * run item replace entity @n[tag=hide.vehicle,distance=0] mob.inventory.1 from entity @s armor.chest
execute on passengers if items entity @s armor.legs * run item replace entity @n[tag=hide.vehicle,distance=0] mob.inventory.2 from entity @s armor.legs
execute on passengers if items entity @s armor.feet * run item replace entity @n[tag=hide.vehicle,distance=0] mob.inventory.3 from entity @s armor.feet

# Store offhand
execute on passengers if items entity @s weapon.offhand * run item replace entity @n[tag=hide.vehicle,distance=0] mob.inventory.4 from entity @s weapon.offhand

# Store mainhand
execute on passengers if items entity @s weapon.mainhand * run item replace entity @n[tag=hide.vehicle,distance=0] mob.inventory.5 from entity @s weapon.mainhand

# Clear equipment
execute on passengers run item replace entity @s armor.head with air
execute on passengers run item replace entity @s armor.chest with air
execute on passengers run item replace entity @s armor.legs with air
execute on passengers run item replace entity @s armor.feet with air
execute on passengers run item replace entity @s weapon.offhand with air
execute on passengers run item replace entity @s weapon.mainhand with air