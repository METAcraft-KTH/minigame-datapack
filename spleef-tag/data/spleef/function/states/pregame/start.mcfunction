# This function is called after lobby time ends, and we want to TP everyone to the arena.
scoreboard players set ?state spleef.game 1

# various configs
#function main:api/end_game
function main:util/reset_gamerules
gamerule fall_damage false
gamerule max_block_modifications 77000

# initialize timer
scoreboard players set ?timer spleef.game 0

# tp everyone to the arena
tp @a 30024 50 50024
execute as @a[tag=!admin] run gamemode adventure

# reset all players' hunger, health, effects, xp, inventory
effect clear @a[tag=!admin]
effect give @a[tag=!admin] saturation 2 99 true
effect give @a[tag=!admin] instant_health 2 99 true
xp set @a[tag=!admin] 0 levels
xp set @a[tag=!admin] 0 points
clear @a[tag=!admin]

# generate map
scoreboard players set ?colors spleef.game 3
function spleef:utility/map/place

item replace entity @a[tag=!admin] weapon.offhand with wind_charge

# set round number
scoreboard players set ?round.number spleef.game 0

execute as @a run function spleefmusic:sans/stop