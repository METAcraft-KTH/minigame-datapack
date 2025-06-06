## INGAME PHASE: The game has begun, and people are playing

# manage rejoin etc
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function tgttos:states/ingame_run/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function tgttos:states/ingame_run/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function tgttos:states/ingame_run/respawn

# increment timer
scoreboard players add ?timer tgttos.game 1
# display round number
bossbar set tgttos:timer name ["FIND THE RIGHT BLOCK!! (",{"score": {"name": "?round.number","objective": "tgttos.game"}},"/10)"]
scoreboard players operation #time tgttos.game = time.ingame_run tgttos.config
scoreboard players operation #time tgttos.game -= ?timer tgttos.game
execute store result bossbar tgttos:timer value run scoreboard players get #time tgttos.game

# title
title @a times 0 10 0
title @a title ""
execute if score ?color.keep tgttos.game matches 1 run title @a subtitle [{"text":"Stand on "},{"text":"red","color":"red"},"!!"]
execute if score ?color.keep tgttos.game matches 2 run title @a subtitle [{"text":"Stand on "},{"text":"yellow","color":"yellow"},"!!"]
execute if score ?color.keep tgttos.game matches 3 run title @a subtitle [{"text":"Stand on "},{"text":"orange","color":"gold"},"!!"]
execute if score ?color.keep tgttos.game matches 4 run title @a subtitle [{"text":"Stand on "},{"text":"purple","color":"light_purple"},"!!"]
execute if score ?color.keep tgttos.game matches 5 run title @a subtitle [{"text":"Stand on "},{"text":"green","color":"green"},"!!"]
execute if score ?color.keep tgttos.game matches 6 run title @a subtitle [{"text":"Stand on "},{"text":"blue","color":"blue"},"!!"]

# kill players who fall off
execute at @n[type=marker,tag=tgttos.tp.arena] run spawnpoint @a[tag=!admin] ~ ~ ~
execute as @a[tag=!admin,scores={tgttos.Y=..0}] run kill @s

# clear everyone's HUNGER!!
effect clear @a[tag=!admin] hunger
effect give @a[tag=!admin,gamemode=!spectator] speed 1 0 true

## end game
execute if score ?timer tgttos.game >= time.ingame_run tgttos.config run function tgttos:states/ingame_pause/start