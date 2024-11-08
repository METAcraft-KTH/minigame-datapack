## TAGGING: TNT has been distributed, go tag!

# manage rejoin etc
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function ttag:states/ingame_tag/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function ttag:states/ingame_tag/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function ttag:states/ingame_tag/respawn

# increment timer
scoreboard players add ?timer ttag.game 1
# calculate remaining time
scoreboard players operation #remainingseconds ttag.game = time.ingame_tag ttag.config
scoreboard players operation #remainingseconds ttag.game -= ?timer ttag.game
scoreboard players operation #remainingseconds ttag.game /= 20 GLOBAL
scoreboard players operation #displayminutes ttag.game = #remainingseconds ttag.game
scoreboard players operation #displayminutes ttag.game /= 60 GLOBAL
scoreboard players operation #displayseconds ttag.game = #remainingseconds ttag.game
scoreboard players operation #displayseconds ttag.game %= 60 GLOBAL
# display remaining time
execute if score #displayseconds ttag.game matches ..9 run bossbar set ttag:timer name ["All TNT explode in ",{"score": {"name": "#displayminutes","objective": "ttag.game"}},":0",{"score": {"name": "#displayseconds","objective": "ttag.game"}}]
execute if score #displayseconds ttag.game matches 10.. run bossbar set ttag:timer name ["All TNT explode in ",{"score": {"name": "#displayminutes","objective": "ttag.game"}},":",{"score": {"name": "#displayseconds","objective": "ttag.game"}}]
execute store result bossbar ttag:timer value run scoreboard players get ?timer ttag.game

## TODO: give points to tnt holders every 10 ticks

# give effects
effect give @a[team=ttag.tagged,tag=!admin] speed 2 3 true
effect give @a[team=ttag.tagged,tag=!admin] jump_boost 2 0 true
effect give @a[team=!ttag.tagged,tag=!admin] speed 2 1 true
effect give @a[tag=!admin] regeneration 2 9 true
# actionbar info
title @a[team=ttag.tagged] actionbar [{"text":"YOU ARE HOLDING TNT!","color":"red","bold":true},{"text":" Punch someone else to give it away!","bold":false}]
title @a[team=!ttag.tagged] actionbar {"text":"You are not holding TNT, avoid players who do!","bold":false}

## end round
execute if score ?timer ttag.game >= time.ingame_tag ttag.config run function ttag:states/ingame_grace/start