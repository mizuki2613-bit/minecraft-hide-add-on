team add hide.hiding_team
team modify hide.hiding_team collisionRule never
team modify hide.hiding_team friendlyFire false

scoreboard objectives add hide.count dummy
scoreboard objectives add hide.hiding_time dummy
scoreboard objectives add hide.gamemode dummy
scoreboard objectives add hide.walk minecraft.custom:minecraft.walk_one_cm
scoreboard objectives add hide.dash minecraft.custom:minecraft.sprint_one_cm

scoreboard players set HIDE_READY hide.count 50