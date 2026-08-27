# Progress bar
execute if score @s hide.count matches 0..9 run return run title @s actionbar [{"sprite":"block/redstone_lamp","color":"gray"},{"sprite":"block/redstone_lamp","color":"gray"},{"sprite":"block/redstone_lamp","color":"gray"},{"sprite":"block/redstone_lamp","color":"gray"},{"sprite":"block/redstone_lamp","color":"gray"}]
execute if score @s hide.count matches 10..19 run return run title @s actionbar [{"sprite":"block/redstone_lamp_on"},{"sprite":"block/redstone_lamp","color":"gray"},{"sprite":"block/redstone_lamp","color":"gray"},{"sprite":"block/redstone_lamp","color":"gray"},{"sprite":"block/redstone_lamp","color":"gray"}]
execute if score @s hide.count matches 20..29 run return run title @s actionbar [{"sprite":"block/redstone_lamp_on"},{"sprite":"block/redstone_lamp_on"},{"sprite":"block/redstone_lamp","color":"gray"},{"sprite":"block/redstone_lamp","color":"gray"},{"sprite":"block/redstone_lamp","color":"gray"}]
execute if score @s hide.count matches 30..39 run return run title @s actionbar [{"sprite":"block/redstone_lamp_on"},{"sprite":"block/redstone_lamp_on"},{"sprite":"block/redstone_lamp_on"},{"sprite":"block/redstone_lamp","color":"gray"},{"sprite":"block/redstone_lamp","color":"gray"}]
execute if score @s hide.count matches 40..49 run return run title @s actionbar [{"sprite":"block/redstone_lamp_on"},{"sprite":"block/redstone_lamp_on"},{"sprite":"block/redstone_lamp_on"},{"sprite":"block/redstone_lamp_on"},{"sprite":"block/redstone_lamp","color":"gray"}]


# Error message
execute unless score @s hide.count >= HIDE_READY hide.count run return fail

execute if score @s hide.count = HIDE_READY hide.count run playsound block.note_block.snare master @s ~ ~ ~ 1

execute if predicate hide:is_sneaking run return run title @s actionbar {"color":"red","bold":1b,"text":"Let go of the sneak key!"}
execute if block ~ ~-1 ~ #hide:not_full run return run title @s actionbar {"color":"red","bold":1b,"text":"You can't hide here."}
execute unless block ~ ~1 ~ #air run return run title @s actionbar {"color":"red","bold":1b,"text":"You can't hide here."}
execute unless block ~ ~ ~ #air run title @s actionbar {"color":"red","bold":1b,"text":"You can't hide here."}