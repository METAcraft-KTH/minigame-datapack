## LOBBY PHASE: Players are still in the Campus lobby.

# manage rejoin etc
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function spl:states/lobby/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function spl:states/lobby/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function spl:states/lobby/respawn

gamemode adventure @a[tag=!admin]

# increment timer
scoreboard players add ?timer spl.game 1
# calculate remaining time
scoreboard players operation #remainingseconds spl.game = time.lobby spl.config
scoreboard players operation #remainingseconds spl.game -= ?timer spl.game
scoreboard players operation #remainingseconds spl.game /= 20 GLOBAL
scoreboard players operation #displayminutes spl.game = #remainingseconds spl.game
scoreboard players operation #displayminutes spl.game /= 60 GLOBAL
scoreboard players operation #displayseconds spl.game = #remainingseconds spl.game
scoreboard players operation #displayseconds spl.game %= 60 GLOBAL
# display remaining time
execute if score #displayseconds spl.game matches ..9 run bossbar set spl:timer name [{"score": {"name": "#displayminutes","objective": "spl.game"}},":0",{"score": {"name": "#displayseconds","objective": "spl.game"}}," until Spleef Megamix begins"]
execute if score #displayseconds spl.game matches 10.. run bossbar set spl:timer name [{"score": {"name": "#displayminutes","objective": "spl.game"}},":",{"score": {"name": "#displayseconds","objective": "spl.game"}}," until Spleef Megamix begins"]
execute store result bossbar spl:timer value run scoreboard players get ?timer spl.game

effect give @a saturation infinite 0 true

## start game
execute if score ?timer spl.game >= time.lobby spl.config run function spl:states/pregame/start