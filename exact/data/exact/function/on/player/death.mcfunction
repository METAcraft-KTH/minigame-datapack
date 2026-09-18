# ============================================================
# exact:on/player/death
# Called by: main:private/call/death
# Executor:  Player who died
# Preconditions: superstate == 3
#
# Hearts are the life counter, so a death means the player ran
# out of them: they are eliminated for the rest of the game.
# ============================================================

execute unless score ?superstate main.state matches 3 run return 0

tag @s add exact.dead
tag @s remove exact.win

gamemode spectator @s
effect clear @s
clear @s

title @s clear
title @s times 0 60 20
title @s title {"text":"ELIMINATED","color":"red","bold":true}
title @s subtitle {"text":"You ran out of hearts!","color":"gray"}

tellraw @a ["",{"selector":"@s","color":"red"},{"text":" has been eliminated!","color":"gray"}]
execute as @a at @s run playsound entity.wither.spawn master @s ~ ~ ~ 0.4 1.6
