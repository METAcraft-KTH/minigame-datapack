## POSTGAME: The game has ended, and players will be teleported back soon.

# manage rejoin etc (you should prob not be able to die in this phase)
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function buildmart:states/postgame/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function buildmart:states/postgame/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function buildmart:states/postgame/respawn

# increment timer
scoreboard players add ?timer buildmart.game 1
# calculate remaining time
scoreboard players operation #remainingseconds buildmart.game = time.postgame buildmart.config
scoreboard players operation #remainingseconds buildmart.game -= ?timer buildmart.game
scoreboard players operation #remainingseconds buildmart.game /= 20 GLOBAL
scoreboard players operation #displayminutes buildmart.game = #remainingseconds buildmart.game
scoreboard players operation #displayminutes buildmart.game /= 60 GLOBAL
scoreboard players operation #displayseconds buildmart.game = #remainingseconds buildmart.game
scoreboard players operation #displayseconds buildmart.game %= 60 GLOBAL
# display remaining time
execute if score #displayseconds buildmart.game matches ..9 run bossbar set buildmart:timer name ["Returning to lobby in ",{"score": {"name": "#displayminutes","objective": "buildmart.game"}},":0",{"score": {"name": "#displayseconds","objective": "buildmart.game"}}]
execute if score #displayseconds buildmart.game matches 10.. run bossbar set buildmart:timer name ["Returning to lobby in ",{"score": {"name": "#displayminutes","objective": "buildmart.game"}},":",{"score": {"name": "#displayseconds","objective": "buildmart.game"}}]
execute store result bossbar buildmart:timer value run scoreboard players get ?timer buildmart.game

## return to lobby
execute if score ?timer buildmart.game >= time.postgame buildmart.config run function buildmart:exit
