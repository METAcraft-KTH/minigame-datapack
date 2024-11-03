## POSTGAME: The game has ended, and players will be teleported back soon.

# manage rejoin etc (you should prob not be able to die in this phase)
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function qq:states/postgame/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function qq:states/postgame/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function qq:states/postgame/respawn

# increment timer
scoreboard players add ?timer qq.game 1
# calculate remaining time
scoreboard players operation #remainingseconds qq.game = time.postgame qq.config
scoreboard players operation #remainingseconds qq.game -= ?timer qq.game
scoreboard players operation #remainingseconds qq.game /= 20 GLOBAL
scoreboard players operation #displayminutes qq.game = #remainingseconds qq.game
scoreboard players operation #displayminutes qq.game /= 60 GLOBAL
scoreboard players operation #displayseconds qq.game = #remainingseconds qq.game
scoreboard players operation #displayseconds qq.game %= 60 GLOBAL
# display remaining time
# if not last mode
execute unless score mode qq.config matches 3 if score #displayseconds qq.game matches ..9 run bossbar set qq:timer name ["Travelling to next mode in ",{"score": {"name": "#displayminutes","objective": "qq.game"}},":0",{"score": {"name": "#displayseconds","objective": "qq.game"}}]
execute unless score mode qq.config matches 3 if score #displayseconds qq.game matches 10.. run bossbar set qq:timer name ["Travelling to next mode in ",{"score": {"name": "#displayminutes","objective": "qq.game"}},":",{"score": {"name": "#displayseconds","objective": "qq.game"}}]

# if last mode
execute if score mode qq.config matches 3 if score #displayseconds qq.game matches ..9 run bossbar set qq:timer name ["Returning to lobby in ",{"score": {"name": "#displayminutes","objective": "qq.game"}},":0",{"score": {"name": "#displayseconds","objective": "qq.game"}}]
execute if score mode qq.config matches 3 if score #displayseconds qq.game matches 10.. run bossbar set qq:timer name ["Returning to lobby in ",{"score": {"name": "#displayminutes","objective": "qq.game"}},":",{"score": {"name": "#displayseconds","objective": "qq.game"}}]

execute store result bossbar qq:timer value run scoreboard players get ?timer qq.game

## next mode or return to lobby
execute if score ?timer qq.game >= time.postgame qq.config run function qq:states/postgame/next_mode