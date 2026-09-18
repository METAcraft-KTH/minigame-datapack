# ============================================================
# walls:debug/golem
# Called by: walls:debug/check
# Executor:  One defending golem
# ============================================================

execute store result score #dbg walls.temp run data get entity @s Health
execute store result score #dbg2 walls.temp run attribute @s minecraft:max_health get
tellraw @a [{text:" golem health / max (want 300 / 300): ",color:"gray"},{score:{name:"#dbg",objective:"walls.temp"},color:"white"},{text:" / ",color:"gray"},{score:{name:"#dbg2",objective:"walls.temp"},color:"white"},{text:" at ",color:"gray"},{nbt:"Pos",entity:"@s",interpret:false,separator:" ",color:"dark_gray"}]
