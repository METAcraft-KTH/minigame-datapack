## GRACE PERIOD: after a round of tagging

# manage rejoin etc
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function ttag:states/ingame_grace/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function ttag:states/ingame_grace/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function ttag:states/ingame_grace/respawn

# increment timer
scoreboard players add ?timer ttag.game 1
# calculate remaining time
scoreboard players operation #remainingseconds ttag.game = time.ingame_grace ttag.config
scoreboard players operation #remainingseconds ttag.game -= ?timer ttag.game
scoreboard players operation #remainingseconds ttag.game /= 20 GLOBAL
scoreboard players operation #displayminutes ttag.game = #remainingseconds ttag.game
scoreboard players operation #displayminutes ttag.game /= 60 GLOBAL
scoreboard players operation #displayseconds ttag.game = #remainingseconds ttag.game
scoreboard players operation #displayseconds ttag.game %= 60 GLOBAL
# display remaining time
bossbar set ttag:timer color red
execute if score #displayseconds ttag.game matches ..9 run bossbar set ttag:timer name ["Next round begins in ",{"score": {"name": "#displayminutes","objective": "ttag.game"}},":0",{"score": {"name": "#displayseconds","objective": "ttag.game"}}]
execute if score #displayseconds ttag.game matches 10.. run bossbar set ttag:timer name ["Next round begins in ",{"score": {"name": "#displayminutes","objective": "ttag.game"}},":",{"score": {"name": "#displayseconds","objective": "ttag.game"}}]
execute store result bossbar ttag:timer value run scoreboard players get ?timer ttag.game

# give effects
effect give @a[team=ttag.tagged,tag=!admin] speed 2 3 true
effect give @a[team=ttag.tagged,tag=!admin] jump_boost 2 0 true
effect give @a[team=!ttag.tagged,tag=!admin] speed 2 1 true
effect give @a[tag=!admin] regeneration 2 9 true

## wait 5 ticks to check for death by TNT
execute if score ?timer ttag.game matches 5 run function ttag:states/ingame_grace/check_alive

## end game if round max, else new round
execute if score ?timer ttag.game >= time.ingame_grace ttag.config if score ?round ttag.game >= round.max ttag.config run return run function ttag:states/postgame/start
execute if score ?timer ttag.game >= time.ingame_grace ttag.config run function ttag:states/ingame_tag/start