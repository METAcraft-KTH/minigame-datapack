# This function is called after lobby time ends, and we want to TP everyone to the arena.
scoreboard players set ?state spleef.game 1

# various configs
function spleef:states/pregame/configure_gamerule

# initialize timer
execute store result bossbar spleef:timer max run scoreboard players get time.pregame spleef.config
scoreboard players set ?timer spleef.game 0

# tp everyone to the arena
tp @a[tag=!admin] @n[tag=spleef.tp.arena]
gamemode adventure @a[tag=!admin]

# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1
execute as @a[tag=!admin] run function spleef:states/pregame/reset_player

# reset all players' hunger, health, effects, xp, inventory
effect clear @a[tag=!admin]
effect give @a[tag=!admin] saturation 2 99 true
effect give @a[tag=!admin] instant_health 2 99 true
xp set @a[tag=!admin] 0 levels
xp set @a[tag=!admin] 0 points
clear @a[tag=!admin]

# generate map
scoreboard players set ?colors spleef.game 3
function spleef:utility/game/blocks/place/run

item replace entity @a[tag=!admin] weapon.offhand with wind_charge

# set round number
scoreboard players set ?round.number spleef.game 0

execute as @a run function spleefmusic:badapple/stop

tellraw @a {"text":"\nGAME 4: HELA HAVET SPLEEFAR (again)","color":"gold","bold":true}
tellraw @a {"text":"- Don't fall into the void",color:"gray"}
tellraw @a {"text":"- Earn points for each player that falls into the void before you",color:"gray"}
tellraw @a {"text":"- Bonus points for surviving the whole round\n",color:"gray"}
tellraw @a {"text":"- Extra points for staying till top 10 \n",color:"gray"}