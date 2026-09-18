# ============================================================
# walls:state/drop/enter
# Called by: walls:state/prep/tick (once)
# Executor:  Server
#
# Phase 1: the wall comes down.
# ============================================================

scoreboard players set ?phase walls.state 1
scoreboard players set ?wall_step walls.state 0

title @a times 5 50 20
title @a title {text:"THE WALL FALLS",color:"red",bold:true}
title @a subtitle {text:"Kill the enemy wardens!",color:"yellow"}
tellraw @a {text:"The wall is gone. Both sides are open — go take their wardens down.",color:"yellow"}
execute as @a at @s run playsound entity.wither.spawn master @s ~ ~ ~ 1 1

# the wardens have been untouchable up to now
execute as @e[type=warden,tag=walls.warden] run data merge entity @s {Invulnerable:0b}

bossbar set walls:timer visible false
