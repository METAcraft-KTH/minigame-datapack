## INGAME states: The game has begun, and people are playing

# manage rejoin etc
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function spl:states/ingame/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function spl:states/ingame/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function spl:states/ingame/respawn

# increment timer
scoreboard players add ?timer spl.game 1
# calculate remaining time
scoreboard players operation #remainingseconds spl.game = ?timer spl.game
scoreboard players operation #remainingseconds spl.game /= 20 GLOBAL
scoreboard players operation #displayminutes spl.game = #remainingseconds spl.game
scoreboard players operation #displayminutes spl.game /= 60 GLOBAL
scoreboard players operation #displayseconds spl.game = #remainingseconds spl.game
scoreboard players operation #displayseconds spl.game %= 60 GLOBAL
# display remaining time
execute if score #displayseconds spl.game matches ..9 run bossbar set spl:timer name [{"score": {"name": "#displayminutes","objective": "spl.game"}},":0",{"score": {"name": "#displayseconds","objective": "spl.game"}}]
execute if score #displayseconds spl.game matches 10.. run bossbar set spl:timer name [{"score": {"name": "#displayminutes","objective": "spl.game"}},":",{"score": {"name": "#displayseconds","objective": "spl.game"}}]
execute store result bossbar spl:timer value run scoreboard players get ?timer spl.game

## end game
execute if score ?timer spl.game >= time.ingame spl.config run function spl:states/postgame/start

execute as @e[type=arrow,nbt={inGround:1b}] at @s run function spl:entity/arrow
execute as @e[type=potion] at @s run function spl:entity/potion
execute as @e[type=egg] at @s run function spl:entity/egg
execute as @e[tag=tnt_run_marker] at @s run function spl:entity/tnt_run
execute as @e[tag=rain_rider] at @s run function spl:entity/rain_rider

scoreboard players remove .subsecond Spleef.Temp 1
execute if score .subsecond Spleef.Temp matches ..0 run scoreboard players remove .typetimeleft Spleef.State 1
execute if score .subsecond Spleef.Temp matches ..0 if score .typetimeleft Spleef.State matches ..5 run function spl:states/ingame/countdown
execute if score .subsecond Spleef.Temp matches ..0 run scoreboard players set .subsecond Spleef.Temp 20

execute if score .type Spleef.State matches 2 if score .tnt_run_grace Spleef.Temp matches 1.. run scoreboard players remove .tnt_run_grace Spleef.Temp 1
execute if score .type Spleef.State matches 2 if score .tnt_run_grace Spleef.Temp matches ..0 as @a[tag=spleef_ingame,tag=!spleef_dead] at @s if data entity @s OnGround run summon marker ~ ~ ~ {Tags:["tnt_run_marker"]}
execute if score .type Spleef.State matches 3 as @a[tag=spleef_ingame] run item replace entity @s hotbar.0 with egg 16

execute if score .typetimeleft Spleef.State matches ..0 run function spl:states/ingame/newtype

## disable item dropping
execute as @e[type=item] run data merge entity @s {PickupDelay:0s}

## check for player deaths
execute store result score .playersleft Spleef.State if entity @a[tag=spleef_ingame,tag=!spleef_dead]
execute as @a[tag=spleef_ingame,tag=!spleef_dead] store result score @s Spleef.Y run data get entity @s Pos[1] 1
execute as @a[tag=spleef_ingame,tag=!spleef_dead] if score @s Spleef.Y matches ..145 at @s run function spl:states/ingame/death

## rain
function spl:states/ingame/rain
execute if score .rain Spleef.State matches 1.. run effect give @a glowing 2 0 true

execute if score .playersleft Spleef.State matches 1 run function spl:states/postgame/start