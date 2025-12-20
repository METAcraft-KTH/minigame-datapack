# This function is called after pregame
scoreboard players set ?state tgttos.game 21

# initialize timer
execute store result bossbar tgttos:timer max run scoreboard players get time.ingame_build tgttos.config
scoreboard players set ?timer tgttos.game 0

# tp everyone to the arena
#tp @a[tag=!admin] @n[tag=tgttos.tp.arena]

# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1
execute as @a[tag=!admin] run function tgttos:states/ingame_run/reset_player

title @a title {"text":"BUILD THE ARENA!","color":"gold"}
flight enable @a

gamemode survival @a[tag=!admin]
clear @a[tag=!admin]
give @a[tag=!admin] oak_planks 64
give @a[tag=!admin] oak_planks 64
give @a[tag=!admin] cobblestone 64
give @a[tag=!admin] cobblestone 64
give @a[tag=!admin] netherite_axe
give @a[tag=!admin] netherite_pickaxe

execute if score ?round.number tgttos.game matches 1 in minecraft:overworld run tp @a[tag=!admin] 30008.80 9.49 43.19
execute if score ?round.number tgttos.game matches 1 in minecraft:overworld run spawnpoint @a 30008 9 43
execute if score ?round.number tgttos.game matches 1 in minecraft:overworld run setworldspawn 30008 9 43
execute if score ?round.number tgttos.game matches 1 in minecraft:overworld run worldborder center 30008 43
execute if score ?round.number tgttos.game matches 1 in minecraft:overworld run worldborder set 33

execute if score ?round.number tgttos.game matches 2 in minecraft:overworld run tp @a[tag=!admin] 29868.85 33.47 42.53
execute if score ?round.number tgttos.game matches 2 in minecraft:overworld run spawnpoint @a 29868 33 42
execute if score ?round.number tgttos.game matches 2 in minecraft:overworld run setworldspawn 29868 33 42
execute if score ?round.number tgttos.game matches 2 in minecraft:overworld run worldborder center 29868 42
execute if score ?round.number tgttos.game matches 2 in minecraft:overworld run worldborder set 49

execute if score ?round.number tgttos.game matches 3 in minecraft:overworld run tp @a[tag=!admin] 29692.75 48.00 34.68 2522.25 0.60
execute if score ?round.number tgttos.game matches 3 in minecraft:overworld run spawnpoint @a 29692 48 34
execute if score ?round.number tgttos.game matches 3 in minecraft:overworld run setworldspawn 29692 48 34
execute if score ?round.number tgttos.game matches 3 in minecraft:overworld run worldborder center 29692 34
execute if score ?round.number tgttos.game matches 3 in minecraft:overworld run worldborder set 40