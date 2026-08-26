team add hide.hiding_team
team modify hide.hiding_team collisionRule never
team modify hide.hiding_team friendlyFire false
team modify hide.hiding_team nametagVisibility never
team modify hide.hiding_team seeFriendlyInvisibles false

scoreboard objectives add hide.count dummy
scoreboard objectives add hide.gamemode dummy

scoreboard players set HIDE_READY hide.count 50
