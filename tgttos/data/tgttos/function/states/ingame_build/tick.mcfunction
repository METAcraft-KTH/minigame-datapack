## INGAME PHASE: The game has begun, and people are playing

# manage rejoin etc
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function tgttos:states/ingame_build/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function tgttos:states/ingame_build/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function tgttos:states/ingame_build/respawn

# increment timer
scoreboard players add ?timer tgttos.game 1
# calculate remaining time
scoreboard players operation #remainingtime tgttos.game = time.ingame_build tgttos.config
scoreboard players operation #remainingseconds tgttos.game = time.ingame_build tgttos.config
scoreboard players operation #remainingseconds tgttos.game -= ?timer tgttos.game
scoreboard players operation #remainingseconds tgttos.game /= 20 GLOBAL
scoreboard players operation #displayminutes tgttos.game = #remainingseconds tgttos.game
scoreboard players operation #displayminutes tgttos.game /= 60 GLOBAL
scoreboard players operation #displayseconds tgttos.game = #remainingseconds tgttos.game
scoreboard players operation #displayseconds tgttos.game %= 60 GLOBAL
# display remaining time
execute if score #displayseconds tgttos.game matches ..9 run bossbar set tgttos:timer name ["Stop building in ",{"score": {"name": "#displayminutes","objective": "tgttos.game"}},":0",{"score": {"name": "#displayseconds","objective": "tgttos.game"}}]
execute if score #displayseconds tgttos.game matches 10.. run bossbar set tgttos:timer name ["Stop building in ",{"score": {"name": "#displayminutes","objective": "tgttos.game"}},":",{"score": {"name": "#displayseconds","objective": "tgttos.game"}}]
execute store result bossbar tgttos:timer value run scoreboard players get ?timer tgttos.game

# kill players who fall off / are on fire
#execute at @n[type=marker,tag=tgttos.tp.arena] run spawnpoint @a[tag=!admin] ~ ~ ~ ~
execute if score ?round.number tgttos.game matches ..4 as @a[tag=!admin] if predicate {condition:"any_of",terms:[{condition:"entity_properties",entity:"this",predicate:{flags:{is_on_fire:true}}},{condition:"entity_properties",entity:"this",predicate:{location:{position:{y:{max:-10}}}}}]} run kill @s
#execute if score ?round.number tgttos.game matches 3 as @a[tag=!admin] at @s if block ~ ~-1 ~ end_stone run kill @s

effect give @a[tag=!admin] saturation infinite 0 true
effect give @a[tag=!admin] resistance infinite 4 true

# give wool
function tgttos:states/pregame/give_me_wool

execute if score #remainingtime tgttos.game matches 120 run title @a[tag=!admin] title {"text":"5","color":"green"}
execute if score #remainingtime tgttos.game matches 120 as @a[tag=!admin] at @s run playsound block.note_block.pling player @s ~ ~ ~
execute if score #remainingtime tgttos.game matches 100 run title @a[tag=!admin] title {"text":"4","color":"green"}
execute if score #remainingtime tgttos.game matches 100 as @a[tag=!admin] at @s run playsound block.note_block.pling player @s ~ ~ ~
execute if score #remainingtime tgttos.game matches 80 run title @a[tag=!admin] title {"text":"3","color":"green"}
execute if score #remainingtime tgttos.game matches 80 as @a[tag=!admin] at @s run playsound block.note_block.pling player @s ~ ~ ~
execute if score #remainingtime tgttos.game matches 60 run title @a[tag=!admin] title {"text":"2","color":"green"}
execute if score #remainingtime tgttos.game matches 60 as @a[tag=!admin] at @s run playsound block.note_block.pling player @s ~ ~ ~
execute if score #remainingtime tgttos.game matches 40 run title @a[tag=!admin] title {"text":"1","color":"green"}
execute if score #remainingtime tgttos.game matches 40 as @a[tag=!admin] at @s run playsound block.note_block.pling player @s ~ ~ ~
execute if score #remainingtime tgttos.game matches 20 run title @a[tag=!admin] title {"text":"0?","color":"green"}
execute if score #remainingtime tgttos.game matches 20 as @a[tag=!admin] at @s run playsound block.note_block.pling player @s ~ ~ ~

## end game
execute if score ?timer tgttos.game >= time.ingame_build tgttos.config run function tgttos:states/ingame_pause/start