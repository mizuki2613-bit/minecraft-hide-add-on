scoreboard objectives remove countdown
scoreboard objectives remove walk
scoreboard objectives remove dash
scoreboard objectives remove crouch
scoreboard objectives add countdown dummy
scoreboard objectives add walk minecraft.custom:minecraft.walk_one_cm
scoreboard objectives add dash minecraft.custom:minecraft.sprint_one_cm
scoreboard objectives add crouch minecraft.custom:minecraft.crouch_one_cm
scoreboard players set HIDE_READY countdown 50
team add hide
team modify hide collisionRule never
team modify hide friendlyFire false