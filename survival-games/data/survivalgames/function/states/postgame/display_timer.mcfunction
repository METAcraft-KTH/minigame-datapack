#text Text
# calculate remaining time
scoreboard players operation #remainingseconds SURVIVALGAMES.game = time.postgame SURVIVALGAMES.config
scoreboard players operation #remainingseconds SURVIVALGAMES.game -= ?timer SURVIVALGAMES.game
scoreboard players operation #remainingseconds SURVIVALGAMES.game /= 20 GLOBAL
scoreboard players operation #displayminutes SURVIVALGAMES.game = #remainingseconds SURVIVALGAMES.game
scoreboard players operation #displayminutes SURVIVALGAMES.game /= 60 GLOBAL
scoreboard players operation #displayseconds SURVIVALGAMES.game = #remainingseconds SURVIVALGAMES.game
scoreboard players operation #displayseconds SURVIVALGAMES.game %= 60 GLOBAL
# display remaining time
$execute if score #displayseconds SURVIVALGAMES.game matches ..9 run bossbar set survivalgames:timer name ["$(text) ",{"score": {"name": "#displayminutes","objective": "SURVIVALGAMES.game"}},":0",{"score": {"name": "#displayseconds","objective": "SURVIVALGAMES.game"}}]
$execute if score #displayseconds SURVIVALGAMES.game matches 10.. run bossbar set survivalgames:timer name ["$(text) ",{"score": {"name": "#displayminutes","objective": "SURVIVALGAMES.game"}},":",{"score": {"name": "#displayseconds","objective": "SURVIVALGAMES.game"}}]
execute store result bossbar survivalgames:timer value run scoreboard players get ?timer SURVIVALGAMES.game
