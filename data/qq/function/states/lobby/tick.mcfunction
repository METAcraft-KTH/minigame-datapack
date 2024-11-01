## LOBBY PHASE: Players are still in the Campus lobby.

# manage rejoin etc
execute as @a[scores={GLOBAL.player_left=1..}] run function qq:states/lobby/join
execute as @a[scores={GLOBAL.time_alive=0}] run function qq:states/lobby/while_dead
execute as @a[scores={GLOBAL.time_alive=1}] run function qq:states/lobby/respawn

# increment timer
scoreboard players add ?timer qq.game 1
# calculate remaining time
scoreboard players operation #remainingseconds qq.game = time.lobby qq.config
scoreboard players operation #remainingseconds qq.game -= ?timer qq.game
scoreboard players operation #remainingseconds qq.game /= 20 GLOBAL
scoreboard players operation #displayminutes qq.game = #remainingseconds qq.game
scoreboard players operation #displayminutes qq.game /= 60 GLOBAL
scoreboard players operation #displayseconds qq.game = #remainingseconds qq.game
scoreboard players operation #displayseconds qq.game %= 60 GLOBAL
# display remaining time
execute if score #displayseconds qq.game matches ..9 run bossbar set qq:timer name [{"score": {"name": "#displayminutes","objective": "qq.game"}},":0",{"score": {"name": "#displayseconds","objective": "qq.game"}}," until One in the Quiver begins"]
execute if score #displayseconds qq.game matches 10.. run bossbar set qq:timer name [{"score": {"name": "#displayminutes","objective": "qq.game"}},":",{"score": {"name": "#displayseconds","objective": "qq.game"}}," until One in the Quiver begins"]
execute store result bossbar qq:timer value run scoreboard players get ?timer qq.game

## start game
execute if score ?timer qq.game >= time.lobby qq.config run function qq:states/pregame/start