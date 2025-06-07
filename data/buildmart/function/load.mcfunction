### Initialize scoreboards

# Creating objectives
scoreboard objectives add buildmart.game dummy
scoreboard objectives add buildmart.config dummy
execute unless score ?state buildmart.game matches -2147483648..2147483647 run scoreboard players set ?state buildmart.game -1
# the two global objectives are redeclared here, so the linter won't complain about "unknown objectives"
scoreboard objectives add GLOBAL dummy
scoreboard objectives add GLOBAL.player_in_state dummy
scoreboard objectives add GLOBAL.player_left minecraft.custom:leave_game
scoreboard objectives add GLOBAL.time_alive minecraft.custom:minecraft.time_since_death
scoreboard players set 20 GLOBAL 20
scoreboard players set 60 GLOBAL 60

# unique game id
## !!!EDIT BELOW!!! MUST BE UNIQUE FROM ALL OTHER GAMES IN THE SAME TOURNAMENT!
scoreboard players set id buildmart.config 4

# gamestate (DO NOT change init and lobby)
scoreboard players set state.init buildmart.config -1
scoreboard players set state.lobby buildmart.config 0
## !!!EDIT BELOW!!! add more states as needed for the game.
scoreboard players set state.pregame buildmart.config 1
scoreboard players set state.ingame buildmart.config 2
scoreboard players set state.postgame buildmart.config 3

# how long each gamestate should last
## !!!EDIT BELOW!!! numbers are in ticks
scoreboard players set time.lobby buildmart.config 3600
scoreboard players set time.pregame buildmart.config 600
scoreboard players set time.ingame buildmart.config 12000
scoreboard players set time.postgame buildmart.config 600

# bossbar
bossbar add buildmart:timer ""
bossbar set buildmart:timer visible false

# additional configs: creating teams etc
## !!!EDIT BELOW!!! WHATEVER YOU ADD HERE, REMEMBER TO UNDO IN THE buildmart:exit FUNCTION
#team add ...
scoreboard players set count.items buildmart.config 12
scoreboard objectives add buildmart.display_index dummy
scoreboard players set arena_chunk_radius buildmart.config 20
scoreboard players set chicken_egg_time buildmart.config 200
