# Progress bar
title @s[scores={hide.count=1..10}] actionbar [{"sprite":"block/redstone_lamp","color":"gray"},{"sprite":"block/redstone_lamp","color":"gray"},{"sprite":"block/redstone_lamp","color":"gray"},{"sprite":"block/redstone_lamp","color":"gray"},{"sprite":"block/redstone_lamp","color":"gray"}]
title @s[scores={hide.count=11..20}] actionbar [{"sprite":"block/redstone_lamp_on"},{"sprite":"block/redstone_lamp","color":"gray"},{"sprite":"block/redstone_lamp","color":"gray"},{"sprite":"block/redstone_lamp","color":"gray"},{"sprite":"block/redstone_lamp","color":"gray"}]
title @s[scores={hide.count=21..30}] actionbar [{"sprite":"block/redstone_lamp_on"},{"sprite":"block/redstone_lamp_on"},{"sprite":"block/redstone_lamp","color":"gray"},{"sprite":"block/redstone_lamp","color":"gray"},{"sprite":"block/redstone_lamp","color":"gray"}]
title @s[scores={hide.count=31..40}] actionbar [{"sprite":"block/redstone_lamp_on"},{"sprite":"block/redstone_lamp_on"},{"sprite":"block/redstone_lamp_on"},{"sprite":"block/redstone_lamp","color":"gray"},{"sprite":"block/redstone_lamp","color":"gray"}]
title @s[scores={hide.count=41..50}] actionbar [{"sprite":"block/redstone_lamp_on"},{"sprite":"block/redstone_lamp_on"},{"sprite":"block/redstone_lamp_on"},{"sprite":"block/redstone_lamp_on"},{"sprite":"block/redstone_lamp","color":"gray"}]


# Error message
execute unless score @s hide.count >= HIDE_READY hide.count run return fail

execute if score @s hide.count = HIDE_READY hide.count run playsound block.note_block.snare master @s ~ ~ ~ 1

execute if predicate hide:is_sneaking run title @s actionbar {"color":"red","bold":1b,"text":"Let go of the sneak key!"}
execute if block ~ ~-1 ~ #hide:not_full run title @s actionbar {"color":"red","bold":1b,"text":"You can't hide here."}
execute unless block ~ ~1 ~ #air run title @s actionbar {"color":"red","bold":1b,"text":"You can't hide here."}
execute unless block ~ ~ ~ #air run title @s actionbar {"color":"red","bold":1b,"text":"You can't hide here."}