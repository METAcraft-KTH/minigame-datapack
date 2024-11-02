### Initialize scoreboards

# Creating objectives
scoreboard objectives add hh.game dummy
scoreboard objectives add hh.config dummy
execute unless score ?state hh.game matches -2147483648..2147483647 run scoreboard players set ?state hh.game -1
# the two global objectives are redeclared here, so the linter won't complain about "unknown objectives"
scoreboard objectives add GLOBAL dummy
scoreboard objectives add GLOBAL.player_left minecraft.custom:leave_game
scoreboard objectives add GLOBAL.time_alive minecraft.custom:minecraft.time_since_death
scoreboard players set 20 GLOBAL 20
scoreboard players set 60 GLOBAL 60

# unique game id
## !!!EDIT BELOW!!! MUST BE UNIQUE FROM ALL OTHER GAMES IN THE SAME TOURNAMENT!
scoreboard players set id hh.config 5

# gamestate (DO NOT change init and lobby)
scoreboard players set state.init hh.config -1
scoreboard players set state.lobby hh.config 0
## !!!EDIT BELOW!!! add more states as needed for the game.
scoreboard players set state.pregame hh.config 1
scoreboard players set state.ingame hh.config 2
scoreboard players set state.postgame hh.config 3

# how long each gamestate should last
## !!!EDIT BELOW!!! numbers are in ticks
scoreboard players set time.lobby hh.config 3600
scoreboard players set time.pregame hh.config 600
scoreboard players set time.ingame hh.config 12000
scoreboard players set time.postgame hh.config 600

# bossbar
bossbar add hh:timer ""
bossbar set hh:timer visible false

# additional configs: creating teams etc
## !!!EDIT BELOW!!! WHATEVER YOU ADD HERE, REMEMBER TO UNDO IN THE hh:exit FUNCTION
#team add ...