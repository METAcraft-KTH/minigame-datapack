## INGAME PHASE: The game has begun, and people are playing

# manage rejoin etc
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function survivalgames:states/ingame/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function survivalgames:states/ingame/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function survivalgames:states/ingame/respawn

# increment timer
scoreboard players add ?timer SURVIVALGAMES.game 1
# calculate remaining time
scoreboard players operation #remainingseconds SURVIVALGAMES.game = time.ingame SURVIVALGAMES.config
scoreboard players operation #remainingseconds SURVIVALGAMES.game -= ?timer SURVIVALGAMES.game
scoreboard players operation #remainingseconds SURVIVALGAMES.game /= 20 GLOBAL
scoreboard players operation #displayminutes SURVIVALGAMES.game = #remainingseconds SURVIVALGAMES.game
scoreboard players operation #displayminutes SURVIVALGAMES.game /= 60 GLOBAL
scoreboard players operation #displayseconds SURVIVALGAMES.game = #remainingseconds SURVIVALGAMES.game
scoreboard players operation #displayseconds SURVIVALGAMES.game %= 60 GLOBAL
# display remaining time
execute if score #displayseconds SURVIVALGAMES.game matches ..9 run bossbar set survivalgames:timer name ["SURVIVALGAMES ends in ",{"score": {"name": "#displayminutes","objective": "SURVIVALGAMES.game"}},":0",{"score": {"name": "#displayseconds","objective": "SURVIVALGAMES.game"}}]
execute if score #displayseconds SURVIVALGAMES.game matches 10.. run bossbar set survivalgames:timer name ["SURVIVALGAMES ends in ",{"score": {"name": "#displayminutes","objective": "SURVIVALGAMES.game"}},":",{"score": {"name": "#displayseconds","objective": "SURVIVALGAMES.game"}}]
execute store result bossbar survivalgames:timer value run scoreboard players get ?timer SURVIVALGAMES.game

execute as @e[tag=SURVIVALGAMES.middle] at @s run function survivalgames:run_with_range {function: "survivalgames:states/ingame/try_end_game"}

## end game
execute if score ?timer SURVIVALGAMES.game >= time.ingame SURVIVALGAMES.config run function survivalgames:states/postgame/start
execute store result score #playercount SURVIVALGAMES.tmp if entity @a[gamemode=adventure]
execute if score #playercount SURVIVALGAMES.tmp matches ..1 run function survivalgames:states/postgame/start
