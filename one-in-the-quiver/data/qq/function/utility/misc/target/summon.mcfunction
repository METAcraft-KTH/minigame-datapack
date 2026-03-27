summon marker ~ ~ ~ {Tags:["TargetBlock","this"]}
setblock ~ ~ ~ target
execute as @n[tag=TargetBlock,tag=this] run data modify entity @s data.Origin set from entity @s Pos
tag @e[tag=TargetBlock,tag=this] remove this