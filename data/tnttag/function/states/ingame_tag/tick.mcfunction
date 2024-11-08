## TAGGING: TNT has been distributed, go tag!

# manage rejoin etc
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function tnttag:states/ingame_tag/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function tnttag:states/ingame_tag/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function tnttag:states/ingame_tag/respawn

# increment timer
scoreboard players add ?timer tnttag.game 1
# calculate remaining time
scoreboard players operation #remainingseconds tnttag.game = time.ingame tnttag.config
scoreboard players operation #remainingseconds tnttag.game -= ?timer tnttag.game
scoreboard players operation #remainingseconds tnttag.game /= 20 GLOBAL
scoreboard players operation #displayminutes tnttag.game = #remainingseconds tnttag.game
scoreboard players operation #displayminutes tnttag.game /= 60 GLOBAL
scoreboard players operation #displayseconds tnttag.game = #remainingseconds tnttag.game
scoreboard players operation #displayseconds tnttag.game %= 60 GLOBAL
# display remaining time
execute if score #displayseconds tnttag.game matches ..9 run bossbar set tnttag:timer name ["All TNT explode in ",{"score": {"name": "#displayminutes","objective": "tnttag.game"}},":0",{"score": {"name": "#displayseconds","objective": "tnttag.game"}}]
execute if score #displayseconds tnttag.game matches 10.. run bossbar set tnttag:timer name ["All TNT explode in ",{"score": {"name": "#displayminutes","objective": "tnttag.game"}},":",{"score": {"name": "#displayseconds","objective": "tnttag.game"}}]
execute store result bossbar tnttag:timer value run scoreboard players get ?timer tnttag.game


## TODO: give points to tnt holders every 10 ticks

## end round
execute if score ?timer tnttag.game >= time.ingame tnttag.config run function tnttag:states/ingame_grace/start