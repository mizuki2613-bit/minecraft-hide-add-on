scoreboard objectives add hide.countdown dummy
scoreboard objectives add hide.hiding_time dummy
scoreboard objectives add hide.walk minecraft.custom:minecraft.walk_one_cm
scoreboard objectives add hide.dash minecraft.custom:minecraft.sprint_one_cm
scoreboard objectives add hide.crouch minecraft.custom:minecraft.crouch_one_cm
scoreboard players set HIDE_READY hide.countdown 50

team add hide.hiding
team modify hide.hiding collisionRule never
team modify hide.hiding friendlyFire false