## POSTGAME: The game has ended, and players will be teleported back soon.

# manage rejoin etc (you should prob not be able to die in this phase)
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function spl:states/postgame/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function spl:states/postgame/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function spl:states/postgame/respawn

# increment timer
scoreboard players add ?timer spl.game 1
# calculate remaining time
scoreboard players operation #remainingseconds spl.game = time.postgame spl.config
scoreboard players operation #remainingseconds spl.game -= ?timer spl.game
scoreboard players operation #remainingseconds spl.game /= 20 GLOBAL
scoreboard players operation #displayminutes spl.game = #remainingseconds spl.game
scoreboard players operation #displayminutes spl.game /= 60 GLOBAL
scoreboard players operation #displayseconds spl.game = #remainingseconds spl.game
scoreboard players operation #displayseconds spl.game %= 60 GLOBAL
# display remaining time
execute if score #displayseconds spl.game matches ..9 run bossbar set spl:timer name ["Returning to lobby in ",{"score": {"name": "#displayminutes","objective": "spl.game"}},":0",{"score": {"name": "#displayseconds","objective": "spl.game"}}]
execute if score #displayseconds spl.game matches 10.. run bossbar set spl:timer name ["Returning to lobby in ",{"score": {"name": "#displayminutes","objective": "spl.game"}},":",{"score": {"name": "#displayseconds","objective": "spl.game"}}]
execute store result bossbar spl:timer value run scoreboard players get ?timer spl.game

## return to lobby
execute if score ?timer spl.game >= time.postgame spl.config run function spl:exit