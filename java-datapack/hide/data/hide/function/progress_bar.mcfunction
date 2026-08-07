title @s[scores={countdown=..10}] actionbar {text:"█████",color:dark_gray}
title @s[scores={countdown=11..20}] actionbar [{text:"█",color:green},{text:"████",color:dark_gray}]
title @s[scores={countdown=21..30}] actionbar [{text:"██",color:green},{text:"███",color:dark_gray}]
title @s[scores={countdown=31..40}] actionbar [{text:"███",color:green},{text:"██",color:dark_gray}]
title @s[scores={countdown=41..50}] actionbar [{text:"████",color:green},{text:"█",color:dark_gray}]

#error message
execute unless score @s countdown >= HIDE_READY countdown run return fail

execute if score @s countdown = HIDE_READY countdown run playsound block.note_block.snare master @s ~ ~ ~ 100

execute if predicate hide:is_sneaking run title @s actionbar {color:red,bold:true,text:"Let go of the sneak key!"}
execute if block ~ ~-0.00001 ~ #hide:not_full run title @s actionbar {color:red,bold:true,text:"You can't hide here."}
execute unless block ~ ~1 ~ #air run title @s actionbar {color:red,bold:true,text:"You can't hide here."}
execute unless block ~ ~ ~ #air run title @s actionbar {color:red,bold:true,text:"You can't hide here."}