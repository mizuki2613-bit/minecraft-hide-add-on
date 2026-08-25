# Progress bar
title @s[scores={hide.count=..10}] actionbar {text:"█████",color:dark_gray}
title @s[scores={hide.count=11..20}] actionbar [{text:"█",color:green},{text:"████",color:dark_gray}]
title @s[scores={hide.count=21..30}] actionbar [{text:"██",color:green},{text:"███",color:dark_gray}]
title @s[scores={hide.count=31..40}] actionbar [{text:"███",color:green},{text:"██",color:dark_gray}]
title @s[scores={hide.count=41..50}] actionbar [{text:"████",color:green},{text:"█",color:dark_gray}]

# Error message
execute unless score @s hide.count >= HIDE_READY hide.count run return fail

execute if score @s hide.count = HIDE_READY hide.count run playsound block.note_block.snare master @s ~ ~ ~ 1

execute if predicate hide:is_sneaking run title @s actionbar {color:red,bold:true,text:"Let go of the sneak key!"}
execute if block ~ ~-0.00001 ~ #hide:not_full run title @s actionbar {color:red,bold:true,text:"You can't hide here."}
execute unless block ~ ~1 ~ #air run title @s actionbar {color:red,bold:true,text:"You can't hide here."}
execute unless block ~ ~ ~ #air run title @s actionbar {color:red,bold:true,text:"You can't hide here."}
