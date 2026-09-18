# ============================================================
# walls:golem/sudden_death
# Called by: walls:state/fight/tick (once, at 20 minutes)
# Executor:  Server
#
# Poison cannot land the killing blow, so this does not end the game
# on its own — it just leaves every defending golem on its last legs.
# (Iron golems are not undead, so poison does tick them down.)
# ============================================================

scoreboard players set ?sudden_death walls.state 1
effect give @e[type=iron_golem,tag=walls.golem] poison infinite 1 true

title @a times 5 40 20
title @a title {text:"SUDDEN DEATH",color:"dark_red",bold:true}
title @a subtitle {text:"Every defending golem is poisoned",color:"red"}
tellraw @a {text:"20 minutes gone. All four defending golems are poisoned — finish it.",color:"red"}
execute as @a at @s run playsound entity.wither.ambient master @s ~ ~ ~ 1 0.6
