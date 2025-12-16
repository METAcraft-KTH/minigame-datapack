### Initialize scoreboards

# Creating objectives
scoreboard objectives add exact.game dummy
scoreboard objectives add exact.config dummy
execute unless score ?state exact.game matches -2147483648..2147483647 run scoreboard players set ?state exact.game -1
# the two global objectives are redeclared here, so the linter won't complain about "unknown objectives"
scoreboard objectives add GLOBAL dummy
scoreboard objectives add GLOBAL.player_in_state dummy
scoreboard objectives add GLOBAL.player_left minecraft.custom:leave_game
scoreboard objectives add GLOBAL.time_alive minecraft.custom:minecraft.time_since_death
scoreboard players set 20 GLOBAL 20
scoreboard players set 60 GLOBAL 60

# unique game id
## !!!EDIT BELOW!!! MUST BE UNIQUE FROM ALL OTHER GAMES IN THE SAME TOURNAMENT!
scoreboard players set id exact.config 2

# gamestate (DO NOT change init and lobby)
scoreboard players set state.init exact.config -1
scoreboard players set state.lobby exact.config 0
## !!!EDIT BELOW!!! add more states as needed for the game.
scoreboard players set state.pregame exact.config 1
scoreboard players set state.ingame_run exact.config 22
scoreboard players set state.ingame_pause exact.config 23
scoreboard players set state.postgame exact.config 3

# how long each gamestate should last
## !!!EDIT BELOW!!! numbers are in ticks
scoreboard players set time.lobby exact.config 3600
scoreboard players set time.pregame exact.config 400
scoreboard players set time.ingame_run exact.config 400
scoreboard players set time.ingame_pause exact.config 100
scoreboard players set time.postgame exact.config 600

# bossbar
bossbar add exact:timer ""
bossbar set exact:timer visible false

# additional configs: creating teams etc
## !!!EDIT BELOW!!! WHATEVER YOU ADD HERE, REMEMBER TO UNDO IN THE exact:exit FUNCTION
#team add ...
scoreboard objectives add exact.Y dummy
scoreboard objectives add exact.color dummy

team add exact.temp