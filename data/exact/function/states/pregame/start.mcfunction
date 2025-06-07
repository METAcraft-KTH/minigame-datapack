# This function is called after lobby time ends, and we want to TP everyone to the arena.
scoreboard players set ?state exact.game 1

# various configs
function exact:states/pregame/configure_gamerule

# initialize timer
execute store result bossbar exact:timer max run scoreboard players get time.pregame exact.config
scoreboard players set ?timer exact.game 0

# tp everyone to the arena
tp @a[tag=!admin] @n[tag=exact.tp.arena]
gamemode adventure @a[tag=!admin]

# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1
execute as @a[tag=!admin] run function exact:states/pregame/reset_player

# reset all players' hunger, health, effects, xp, inventory
effect clear @a[tag=!admin]
effect give @a[tag=!admin] saturation 2 99 true
effect give @a[tag=!admin] instant_health 2 99 true
xp set @a[tag=!admin] 0 levels
xp set @a[tag=!admin] 0 points
clear @a[tag=!admin]

tellraw @a {"text":"Welcome to MINECRAFT HEXATHLON 3!","color":"gold","bold":true}

#tellraw @a {"text":"\nGAME 2: TO GET TO THE OTHER SIDE","color":"gold","bold":true}
#tellraw @a {"text":"- Don't fall into the void",color:"gray"}
#tellraw @a {"text":"- Earn points for each player that falls into the void before you",color:"gray"}
#tellraw @a {"text":"- Bonus points for surviving the whole round\n",color:"gray"}
#tellraw @a {"text":"- Extra points for staying till top 10 \n",color:"gray"}