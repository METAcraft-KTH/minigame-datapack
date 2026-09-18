# ============================================================
# walls:state/prep/warn
# Called by: walls:state/prep/tick
# Executor:  Server
#
# "the wall drops in X" shout, reusing the seconds the bossbar
# just computed this tick.
# ============================================================

tellraw @a [{text:"The wall drops in ",color:"yellow"},{score:{name:"#min",objective:"walls.temp"},color:"yellow",bold:true},{text:":",color:"yellow",bold:true},{score:{name:"#sec_tens",objective:"walls.temp"},color:"yellow",bold:true},{score:{name:"#sec_ones",objective:"walls.temp"},color:"yellow",bold:true},{text:"!",color:"yellow"}]
execute as @a at @s run playsound block.note_block.bell master @s ~ ~ ~ 1 1
