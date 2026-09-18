# ============================================================
# walls:wardens/sudden_death
# Called by: walls:state/fight/tick (once, at 20 minutes)
# Executor:  Server
#
# Poison cannot land the killing blow, so this does not end the
# game on its own — it just leaves every warden on its last legs.
# ============================================================

scoreboard players set ?sudden_death walls.state 1
effect give @e[type=warden,tag=walls.warden] poison infinite 1 true

title @a times 5 40 20
title @a title {text:"SUDDEN DEATH",color:"dark_red",bold:true}
title @a subtitle {text:"Every warden is now poisoned",color:"red"}
tellraw @a {text:"20 minutes gone. All four wardens are poisoned — finish it.",color:"red"}
execute as @a at @s run playsound entity.wither.ambient master @s ~ ~ ~ 1 0.6
