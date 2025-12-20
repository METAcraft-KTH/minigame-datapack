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
#execute if score ?round.number exact.game matches ..4 as @a[tag=!admin] if predicate {condition:"any_of",terms:[{condition:"entity_properties",entity:"this",predicate:{flags:{is_on_fire:true}}},{condition:"entity_properties",entity:"this",predicate:{location:{position:{y:{max:5}}}}}]} run kill @s
#execute if score ?round.number exact.game matches 3 as @a[tag=!admin] at @s if block ~ ~-1 ~ end_stone run kill @s

effect give @a[tag=!admin] saturation infinite 0 true
# need to be able to die on game 5 to respawn
execute unless score ?round.number exact.game matches 5 run effect give @a[tag=!admin] resistance 1 4 true

# game 7 kills players if they land on redstone block
execute if score ?round.number exact.game matches 7 as @a[tag=!exact.done,tag=!admin] at @s if block ~ ~-0.1 ~ redstone_block run kill @s

# game 8 is controlled by predicates to count amount of sneaks
execute if score ?round.number exact.game matches 8 as @a[tag=!exact.done] unless score @s exact.is_sneaking matches 1 if predicate exact:is_sneaking run scoreboard players remove @s exact.sneakcount 1
execute if score ?round.number exact.game matches 8 as @a[tag=!exact.done] unless score @s exact.is_sneaking matches 1 if predicate exact:is_sneaking run scoreboard players set @s exact.is_sneaking 1
execute if score ?round.number exact.game matches 8 as @a[tag=!exact.done] if score @s exact.is_sneaking matches 1 unless predicate exact:is_sneaking run scoreboard players set @s exact.is_sneaking 0
execute if score ?round.number exact.game matches 8 as @a[tag=!exact.done] if score @s exact.sneakcount matches 0 run advancement grant @s only exact:8

# game 9 needs people to place beds
execute if score ?round.number exact.game matches 9 as @a[tag=!exact.done] if items entity @s weapon.mainhand #beds run item modify entity @s weapon.mainhand exact:can_place_anywhere
execute if score ?round.number exact.game matches 9 as @a[tag=!exact.done] if items entity @s weapon.offhand #beds run item modify entity @s weapon.offhand exact:can_place_anywhere

title @a times 0 80 20
title @a[tag=!exact.done] title ""
execute if score ?round.number exact.game matches 1 run title @a[tag=!exact.done] subtitle "Stab someone!!"
execute if score ?round.number exact.game matches 2 run title @a[tag=!exact.done] subtitle "Buy anything!!"
execute if score ?round.number exact.game matches 3 run title @a[tag=!exact.done] subtitle "Make babies!!"
execute if score ?round.number exact.game matches 4 run title @a[tag=!exact.done] subtitle "Craft orange dye!!"
execute if score ?round.number exact.game matches 5 run title @a[tag=!exact.done] subtitle "Land in the water!!"
execute if score ?round.number exact.game matches 6 run title @a[tag=!exact.done] subtitle "Parkour!!"
execute if score ?round.number exact.game matches 7 run title @a[tag=!exact.done] subtitle "Pearl to the top!!"
execute if score ?round.number exact.game matches 8 as @a run title @s subtitle ["Sneak ",{score:{objective:"exact.sneakcount",name:"@s"}}," times!!"]
execute if score ?round.number exact.game matches 9 run title @a[tag=!exact.done] subtitle "Make your bed and lie in it!!"
execute if score ?round.number exact.game matches 10 run title @a[tag=!exact.done] subtitle "Shoot a chicken (look up)!!"
execute if score ?round.number exact.game matches 11 run title @a[tag=!exact.done] subtitle "Light a creeper!!"
execute if score ?round.number exact.game matches 12 run title @a[tag=!exact.done] subtitle "Impale yourself??"
execute if score ?round.number exact.game matches 13 run title @a[tag=!exact.done] subtitle "Make cake!!"
execute if score ?round.number exact.game matches 14 run title @a[tag=!exact.done] subtitle "Dig straight down!!"
execute if score ?round.number exact.game matches 15 run title @a[tag=!exact.done] subtitle "Kill a vex!!"

execute as @a if predicate {condition:"entity_properties",entity:"this",predicate:{location:{position:{y:{max:-5}}}}} run tp @s @n[tag=exact.tp.arena]

## end game
execute if score ?timer exact.game >= time.ingame_run exact.config run function exact:states/ingame_pause/start