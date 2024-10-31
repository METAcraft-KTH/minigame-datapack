## LOBBY PHASE: Players are still in the Campus lobby.

# manage rejoin etc
execute as @a[scores={GLOBAL.player_left=1..}] run function gamename:states/lobby/join
execute as @a[scores={GLOBAL.time_alive=0}] run function gamename:states/lobby/while_dead
execute as @a[scores={GLOBAL.time_alive=1}] run function gamename:states/lobby/respawn

# increment timer
scoreboard players add ?timer GAMENAME.game 1
# calculate remaining time
scoreboard players operation #remainingseconds GAMENAME.game = time.lobby GAMENAME.config
scoreboard players operation #remainingseconds GAMENAME.game -= ?timer GAMENAME.game
scoreboard players operation #remainingseconds GAMENAME.game /= 20 GLOBAL
scoreboard players operation #displayminutes GAMENAME.game = #remainingseconds GAMENAME.game
scoreboard players operation #displayminutes GAMENAME.game /= 60 GLOBAL
scoreboard players operation #displayseconds GAMENAME.game = #remainingseconds GAMENAME.game
scoreboard players operation #displayseconds GAMENAME.game %= 60 GLOBAL
# display remaining time
execute if score #displayseconds GAMENAME.game matches ..9 run bossbar set gamename:timer name [{"score": {"name": "#displayminutes","objective": "GAMENAME.game"}},":0",{"score": {"name": "#displayseconds","objective": "GAMENAME.game"}}," until GAMENAME begins"]
execute if score #displayseconds GAMENAME.game matches 10.. run bossbar set gamename:timer name [{"score": {"name": "#displayminutes","objective": "GAMENAME.game"}},":",{"score": {"name": "#displayseconds","objective": "GAMENAME.game"}}," until GAMENAME begins"]
execute store result bossbar gamename:timer value run scoreboard players get ?timer GAMENAME.game

## start game
execute if score ?timer GAMENAME.game >= time.lobby GAMENAME.config run function gamename:states/pregame/start