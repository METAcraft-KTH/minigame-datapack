## INGAME PHASE: The game has begun, and people are playing

# manage rejoin etc
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function exact:states/ingame_run/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function exact:states/ingame_run/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function exact:states/ingame_run/respawn

# increment timer
scoreboard players add ?timer exact.game 1
# calculate remaining time
scoreboard players operation #remainingseconds exact.game = time.ingame_run exact.config
scoreboard players operation #remainingseconds exact.game -= ?timer exact.game
scoreboard players operation #remainingseconds exact.game /= 20 GLOBAL
scoreboard players operation #displayminutes exact.game = #remainingseconds exact.game
scoreboard players operation #displayminutes exact.game /= 60 GLOBAL
scoreboard players operation #displayseconds exact.game = #remainingseconds exact.game
scoreboard players operation #displayseconds exact.game %= 60 GLOBAL
# display remaining time
execute if score #displayseconds exact.game matches ..9 run bossbar set exact:timer name ["Do as told in ",{"score": {"name": "#displayminutes","objective": "exact.game"}},":0",{"score": {"name": "#displayseconds","objective": "exact.game"}}]
execute if score #displayseconds exact.game matches 10.. run bossbar set exact:timer name ["Do as told in ",{"score": {"name": "#displayminutes","objective": "exact.game"}},":",{"score": {"name": "#displayseconds","objective": "exact.game"}}]
execute store result bossbar exact:timer value run scoreboard players get ?timer exact.game

# kill players who fall off / are on fire
execute at @n[type=marker,tag=exact.tp.arena] run spawnpoint @a[tag=!admin] ~ ~ ~ ~ ~
execute if score ?round.number exact.game matches ..4 as @a[tag=!admin] if predicate {condition:"any_of",terms:[{condition:"entity_properties",entity:"this",predicate:{flags:{is_on_fire:true}}},{condition:"entity_properties",entity:"this",predicate:{location:{position:{y:{max:5}}}}}]} run kill @s
execute if score ?round.number exact.game matches 3 as @a[tag=!admin] at @s if block ~ ~-1 ~ end_stone run kill @s

effect give @a[tag=!admin] saturation infinite 0 true
effect give @a[tag=!admin] resistance infinite 4 true

title @a times 0 80 20
title @a[tag=!exact.done] title ""
execute if score ?round.number exact.game matches 1 run title @a[tag=!exact.done] subtitle "Enchant the pickaxe!!"
execute if score ?round.number exact.game matches 2 run title @a[tag=!exact.done] subtitle "Shear a sheep!!"
execute if score ?round.number exact.game matches 3 run title @a[tag=!exact.done] subtitle "Wear full diamond armor!!"
execute if score ?round.number exact.game matches 4 run title @a[tag=!exact.done] subtitle "Power a beacon!!"
execute if score ?round.number exact.game matches 5 run title @a[tag=!exact.done] subtitle "Shoot a chicken!!"
execute if score ?round.number exact.game matches 6 run title @a[tag=!exact.done] subtitle "Drink milk!!"
execute if score ?round.number exact.game matches 7 run title @a[tag=!exact.done] subtitle "Take fall damage!!"
execute if score ?round.number exact.game matches 8 run title @a[tag=!exact.done] subtitle "Buy anything!!"
execute if score ?round.number exact.game matches 9 run title @a[tag=!exact.done] subtitle "Ignite a creeper!!"
execute if score ?round.number exact.game matches 10 run title @a[tag=!exact.done] subtitle "Craft bread!!"
execute if score ?round.number exact.game matches 11 run title @a[tag=!exact.done] subtitle "Enter the void!!"
execute if score ?round.number exact.game matches 12 run title @a[tag=!exact.done] subtitle "Tower up!!"
execute if score ?round.number exact.game matches 13 run title @a[tag=!exact.done] subtitle "Get breeding!!"
execute if score ?round.number exact.game matches 14 run title @a[tag=!exact.done] subtitle "Build an iron golem!!"
execute if score ?round.number exact.game matches 15 run title @a[tag=!exact.done] subtitle "Kill someone!!"

execute as @a if predicate {condition:"entity_properties",entity:"this",predicate:{location:{position:{y:{max:59}}}}} run tp @s @n[tag=exact.tp.arena]

## end game
execute if score ?timer exact.game >= time.ingame_run exact.config run function exact:states/ingame_pause/start