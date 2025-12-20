# This function is called when the playable minigame actually begins.
scoreboard players set ?state tgttos.game 22

# initialize timer
execute store result bossbar tgttos:timer max run scoreboard players get time.ingame_run tgttos.config
scoreboard players set ?timer tgttos.game 0

# tp everyone to the arena

tp @a[tag=!admin] @n[tag=tgttos.tp.1]

# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1
execute as @a[tag=!admin] run function tgttos:states/ingame_run/reset_player

title @a title {"text":"GET TO THE PORTAL!","color":"gold"}
flight disable @a
gamemode adventure @a[tag=!admin]

execute if score ?round.number tgttos.game matches 1 in minecraft:overworld run tp @a[tag=!admin] 30008 1 8 0 0
execute if score ?round.number tgttos.game matches 1 in minecraft:overworld run spawnpoint @a 30008 1 8
execute if score ?round.number tgttos.game matches 1 in minecraft:overworld run setworldspawn 30008 1 8

execute if score ?round.number tgttos.game matches 2 in minecraft:overworld run tp @a[tag=!admin] 29875.70 48.00 -0.45 1800.30 5.70
execute if score ?round.number tgttos.game matches 2 in minecraft:overworld run spawnpoint @a 29875 48 0
execute if score ?round.number tgttos.game matches 2 in minecraft:overworld run setworldspawn 29875 48 0

execute if score ?round.number tgttos.game matches 3 in minecraft:overworld run tp @a[tag=!admin] 29681.42 36.00 -17.78 0 0
execute if score ?round.number tgttos.game matches 3 in minecraft:overworld run spawnpoint @a 29681 36 -17
execute if score ?round.number tgttos.game matches 3 in minecraft:overworld run setworldspawn 29681 36 -17

worldborder set 999999

clear @a[tag=!admin]
execute as @a run function tgttos:states/pregame/give_me_wool
give @a shears[can_break={blocks:["red_wool","orange_wool","yellow_wool","green_wool","blue_wool","light_blue_wool","magenta_wool","purple_wool","lime_wool","cyan_wool","pink_wool"]},enchantments={efficiency:5}]