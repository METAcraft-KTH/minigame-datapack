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

execute unless score ?round.number tgttos.game matches 2 unless score ?round.number tgttos.game matches 5 as @a[tag=!admin] run function tgttos:states/pregame/give_me_wool
execute unless score ?round.number tgttos.game matches 2 unless score ?round.number tgttos.game matches 5 as @a[tag=!admin] run give @s shears[can_break={blocks:["red_wool","orange_wool","yellow_wool","green_wool","blue_wool","light_blue_wool","magenta_wool","purple_wool","lime_wool","cyan_wool","pink_wool"]}]
execute unless score ?round.number tgttos.game matches 3 as @a[tag=!admin] run give @s ender_pearl
execute unless score ?round.number tgttos.game matches 5 as @a[tag=!admin] run give @s horse_spawn_egg[item_name="Spawn a horse, get a saddle!",rarity="rare",entity_data={id:"minecraft:horse",Invulnerable:1b,Tame:1b,attributes:[{id:"minecraft:jump_strength",base:0.8},{id:"minecraft:movement_speed",base:0.3}]},use_remainder={id:"minecraft:saddle",count:1}] 1

#tellraw @a {"text":"\nGAME 2: TO GET TO THE OTHER SIDE","color":"gold","bold":true}
#tellraw @a {"text":"- Don't fall into the void",color:"gray"}
#tellraw @a {"text":"- Earn points for each player that falls into the void before you",color:"gray"}
#tellraw @a {"text":"- Bonus points for surviving the whole round\n",color:"gray"}
#tellraw @a {"text":"- Extra points for staying till top 10 \n",color:"gray"}