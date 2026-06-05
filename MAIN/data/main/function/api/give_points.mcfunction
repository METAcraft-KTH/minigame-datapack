# ============================================================
# Called by: The player to receive 💎s.
#
# Macro args: {points:5,reason:"Survived round"}
# 
# Grants 💎s by calling Alvin's score function,
# and optionally a reason for why it is granted.
# 
# ============================================================

$execute as @s run function score:add_points {points:$(points)}
$tellraw @s ["",{text:"[",color:"gray"},{text:"+$(points)",color:"aqua","bold":true},"💎",{text:" $(reason)]",color:"gray"}]
execute at @s run playsound block.amethyst_block.resonate master @s ~ ~ ~