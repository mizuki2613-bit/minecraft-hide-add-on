team add blockhide.hiding_team
team modify blockhide.hiding_team collisionRule never
team modify blockhide.hiding_team friendlyFire false
team modify blockhide.hiding_team nametagVisibility never
team modify blockhide.hiding_team seeFriendlyInvisibles false

scoreboard objectives add blockhide.count dummy
scoreboard objectives add blockhide.gamemode dummy

scoreboard players set HIDE_READY blockhide.count 50
