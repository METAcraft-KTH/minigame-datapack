## POSTGAME: The game has ended, and players will be teleported back soon.

# manage rejoin etc (you should prob not be able to die in this phase)
execute as @a[scores={GLOBAL.player_left=1..}] run function gamename:states/postgame/join
execute as @a[scores={GLOBAL.time_alive=0}] run function gamename:states/postgame/while_dead
execute as @a[scores={GLOBAL.time_alive=1}] run function gamename:states/postgame/respawn

# increment timer
scoreboard players add ?timer GAMENAME.game 1
# calculate remaining time
scoreboard players operation #remainingseconds GAMENAME.game = time.postgame GAMENAME.config
scoreboard players operation #remainingseconds GAMENAME.game -= ?timer GAMENAME.game
scoreboard players operation #remainingseconds GAMENAME.game /= 20 GLOBAL
scoreboard players operation #displayminutes GAMENAME.game = #remainingseconds GAMENAME.game
scoreboard players operation #displayminutes GAMENAME.game /= 60 GLOBAL
scoreboard players operation #displayseconds GAMENAME.game = #remainingseconds GAMENAME.game
scoreboard players operation #displayseconds GAMENAME.game %= 60 GLOBAL
# display remaining time
execute if score #displayseconds GAMENAME.game matches ..9 run bossbar set gamename:timer name ["Returning to lobby in ",{"score": {"name": "#displayminutes","objective": "GAMENAME.game"}},":0",{"score": {"name": "#displayseconds","objective": "GAMENAME.game"}}]
execute if score #displayseconds GAMENAME.game matches 10.. run bossbar set gamename:timer name ["Returning to lobby in ",{"score": {"name": "#displayminutes","objective": "GAMENAME.game"}},":",{"score": {"name": "#displayseconds","objective": "GAMENAME.game"}}]
execute store result bossbar gamename:timer value run scoreboard players get ?timer GAMENAME.game

## return to lobby
execute if score ?timer GAMENAME.game >= time.postgame GAMENAME.config run function gamename:exit