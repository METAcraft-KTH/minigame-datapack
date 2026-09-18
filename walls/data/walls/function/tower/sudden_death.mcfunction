# ============================================================
# walls:tower/sudden_death
# Called by: walls:state/fight/tick (once, at 20 minutes)
# Executor:  Server
#
# Poison cannot land the killing blow, so this does not end the game
# on its own — it just leaves every tower on its last legs.
# (Ravagers are not undead, so poison does tick them down.)
# ============================================================

scoreboard players set ?sudden_death walls.state 1
effect give @e[type=ravager,tag=walls.tower] poison infinite 1 true

title @a times 5 40 20
title @a title {text:"SUDDEN DEATH",color:"dark_red",bold:true}
title @a subtitle {text:"Every tower is poisoned",color:"red"}
tellraw @a {text:"20 minutes gone. All four towers are poisoned — finish it.",color:"red"}
execute as @a at @s run playsound entity.wither.ambient master @s ~ ~ ~ 1 0.6
