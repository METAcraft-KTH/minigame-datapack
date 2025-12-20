### Initialize scoreboards

# Creating objectives
scoreboard objectives add SURVIVALGAMES.game dummy
scoreboard objectives add SURVIVALGAMES.config dummy
execute unless score ?state SURVIVALGAMES.game matches -2147483648..2147483647 run scoreboard players set ?state SURVIVALGAMES.game -1
# the two global objectives are redeclared here, so the linter won't complain about "unknown objectives"
scoreboard objectives add GLOBAL dummy
scoreboard objectives add GLOBAL.player_in_state dummy
scoreboard objectives add GLOBAL.player_left minecraft.custom:leave_game
scoreboard objectives add GLOBAL.time_alive minecraft.custom:minecraft.time_since_death
scoreboard players set 20 GLOBAL 20
scoreboard players set 60 GLOBAL 60

# unique game id
## !!!EDIT BELOW!!! MUST BE UNIQUE FROM ALL OTHER GAMES IN THE SAME TOURNAMENT!
scoreboard players set id SURVIVALGAMES.config 6

# gamestate (DO NOT change init and lobby)
scoreboard players set state.init SURVIVALGAMES.config -1
scoreboard players set state.lobby SURVIVALGAMES.config 0
## !!!EDIT BELOW!!! add more states as needed for the game.
scoreboard players set state.pregame SURVIVALGAMES.config 1
scoreboard players set state.ingame SURVIVALGAMES.config 2
scoreboard players set state.postgame SURVIVALGAMES.config 3

# how long each gamestate should last
## !!!EDIT BELOW!!! numbers are in ticks
scoreboard players set time.lobby SURVIVALGAMES.config 3600
scoreboard players set time.pregame SURVIVALGAMES.config 600
scoreboard players set time.ingame SURVIVALGAMES.config 12000
scoreboard players set time.postgame SURVIVALGAMES.config 600

# bossbar
bossbar add survivalgames:timer ""
bossbar set survivalgames:timer visible false

# additional configs: creating teams etc
## !!!EDIT BELOW!!! WHATEVER YOU ADD HERE, REMEMBER TO UNDO IN THE survivalgames:exit FUNCTION
#team add ...
scoreboard objectives add SURVIVALGAMES.tmp dummy
scoreboard objectives add SURVIVALGAMES.arena_id dummy
scoreboard objectives add SURVIVALGAMES.lobby_sizes dummy
scoreboard objectives add SURVIVALGAMES.player_round dummy

scoreboard players set arena_radius SURVIVALGAMES.config 500
scoreboard players set round_count SURVIVALGAMES.config 2