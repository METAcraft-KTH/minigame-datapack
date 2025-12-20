# This function is called after lobby time ends, and we want to TP everyone to the arena.
scoreboard players set ?state tgttos.game 1

# various configs
function tgttos:states/pregame/configure_gamerule

# initialize timer
execute store result bossbar tgttos:timer max run scoreboard players get time.pregame tgttos.config
scoreboard players set ?timer tgttos.game 0

# tp everyone to the arena
tp @a[tag=!admin] @n[tag=tgttos.tp.arena]
gamemode adventure @a[tag=!admin]

# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1
execute as @a[tag=!admin] run function tgttos:states/pregame/reset_player

# reset all players' hunger, health, effects, xp, inventory
effect clear @a[tag=!admin]
effect give @a[tag=!admin] saturation 2 99 true
effect give @a[tag=!admin] instant_health 2 99 true
xp set @a[tag=!admin] 0 levels
xp set @a[tag=!admin] 0 points
clear @a[tag=!admin]

execute as @a[tag=!admin] store result score @s tgttos.color run random value 0..10

gamemode spectator @a
tp @a[tag=!admin] 30008 1 8
execute if score ?round.number tgttos.game matches 2 run tp @a[tag=!admin] 29875 48 0
execute if score ?round.number tgttos.game matches 3 run tp @a[tag=!admin] 29681 36 -17

#function tgttos:states/pregame/give_me_wool
#give @s shears[can_break={blocks:["red_wool","orange_wool","yellow_wool","green_wool","blue_wool","light_blue_wool","magenta_wool","purple_wool","lime_wool","cyan_wool","pink_wool"]},enchantments={efficiency:5}]

execute unless score ?round.number tgttos.game matches 2.. run tellraw @a {"text":"\nGAME 3: YOU FUCKIN' BUILD IT THEN IF YOURE SO GOD DAMN SMART","color":"gold","bold":true}
execute unless score ?round.number tgttos.game matches 2.. run tellraw @a {"text":"- Build the obstacle course yourself",color:"gray"}
execute unless score ?round.number tgttos.game matches 2.. run tellraw @a {"text":"- Get to the nether portal as fast as you can",color:"gray"}