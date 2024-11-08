## GRACE PERIOD: after a round of tagging

# manage rejoin etc
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function tnttag:states/ingame_grace/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function tnttag:states/ingame_grace/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function tnttag:states/ingame_grace/respawn

# increment timer
scoreboard players add ?timer tnttag.game 1
# calculate remaining time
scoreboard players operation #remainingseconds tnttag.game = time.ingame_grace tnttag.config
scoreboard players operation #remainingseconds tnttag.game -= ?timer tnttag.game
scoreboard players operation #remainingseconds tnttag.game /= 20 GLOBAL
scoreboard players operation #displayminutes tnttag.game = #remainingseconds tnttag.game
scoreboard players operation #displayminutes tnttag.game /= 60 GLOBAL
scoreboard players operation #displayseconds tnttag.game = #remainingseconds tnttag.game
scoreboard players operation #displayseconds tnttag.game %= 60 GLOBAL
# display remaining time
bossbar set tnttag:timer color red
execute if score #displayseconds tnttag.game matches ..9 run bossbar set tnttag:timer name ["Next round begins in ",{"score": {"name": "#displayminutes","objective": "tnttag.game"}},":0",{"score": {"name": "#displayseconds","objective": "tnttag.game"}}]
execute if score #displayseconds tnttag.game matches 10.. run bossbar set tnttag:timer name ["Next round begins in ",{"score": {"name": "#displayminutes","objective": "tnttag.game"}},":",{"score": {"name": "#displayseconds","objective": "tnttag.game"}}]
execute store result bossbar tnttag:timer value run scoreboard players get ?timer tnttag.game

# give effects
effect give @a[team=tnttag.tagged,tag=!admin] speed 2 3 true
effect give @a[team=tnttag.tagged,tag=!admin] jump_boost 2 0 true
effect give @a[team=!tnttag.tagged,tag=!admin] speed 2 1 true
effect give @a[tag=!admin] regeneration 2 9 true

## wait 5 ticks to check for death by TNT
execute if score ?timer tnttag.game matches 5 run function tnttag:states/ingame_grace/check_alive

## end game if round max, else new round
execute if score ?timer tnttag.game >= time.ingame_grace tnttag.config if score ?round tnttag.game >= round.max tnttag.config run return run function tnttag:states/postgame/start
execute if score ?timer tnttag.game >= time.ingame_grace tnttag.config run function tnttag:states/ingame_tag/start