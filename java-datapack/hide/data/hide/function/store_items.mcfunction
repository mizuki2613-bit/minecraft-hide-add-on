#store equipment
$execute if items entity @s armor.head * run item replace entity $(store) mob.inventory.0 from entity @s armor.head
$execute if items entity @s armor.chest * run item replace entity $(store) mob.inventory.1 from entity @s armor.chest
$execute if items entity @s armor.legs * run item replace entity $(store) mob.inventory.2 from entity @s armor.legs
$execute if items entity @s armor.feet * run item replace entity $(store) mob.inventory.3 from entity @s armor.feet
$execute if items entity @s weapon.offhand * run item replace entity $(store) mob.inventory.4 from entity @s weapon.offhand
$execute if items entity @s weapon.mainhand * run item replace entity $(store) mob.inventory.5 from entity @s weapon.mainhand
$execute on passengers if items entity $(store) weapon.offhand * run item replace entity $(store) mob.inventory.4 from entity $(store) weapon.offhand
$execute on passengers if items entity $(store) weapon.mainhand * run item replace entity $(store) mob.inventory.5 from entity $(store) weapon.mainhand

#clear equipment
item replace entity @s armor.head with air
item replace entity @s armor.chest with air
item replace entity @s armor.legs with air
item replace entity @s armor.feet with air
item replace entity @s weapon.offhand with air
item replace entity @s weapon.mainhand with air