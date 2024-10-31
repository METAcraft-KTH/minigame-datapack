### Initialize scoreboards

# Creating objectives
scoreboard objectives add GAMENAME.game dummy
scoreboard objectives add GAMENAME.config dummy
execute unless score ?state GAMENAME.game matches -2147483648..2147483647 run scoreboard players set ?state GAMENAME.game -1
# the two global objectives are redeclared here, so the linter won't complain about "unknown objectives"
scoreboard objectives add GLOBAL dummy
scoreboard objectives add GLOBAL.player_left minecraft.custom:leave_game
scoreboard objectives add GLOBAL.time_alive minecraft.custom:minecraft.time_since_death
scoreboard players set 20 GLOBAL 20
scoreboard players set 60 GLOBAL 60

# unique game id
## !!!EDIT BELOW!!! MUST BE UNIQUE FROM ALL OTHER GAMES IN THE SAME TOURNAMENT!
scoreboard players set id GAMENAME.config 

# gamestate (DO NOT change init and lobby)
scoreboard players set state.init GAMENAME.config -1
scoreboard players set state.lobby GAMENAME.config 0
## !!!EDIT BELOW!!! add more states as needed for the game.
scoreboard players set state.pregame GAMENAME.config 1
scoreboard players set state.ingame GAMENAME.config 2
scoreboard players set state.postgame GAMENAME.config 3

# how long each gamestate should last
## !!!EDIT BELOW!!! numbers are in ticks
scoreboard players set time.lobby GAMENAME.config 3600
scoreboard players set time.pregame GAMENAME.config 600
scoreboard players set time.ingame GAMENAME.config 12000
scoreboard players set time.postgame GAMENAME.config 600

# bossbar
bossbar add gamename:timer ""
bossbar set gamename:timer visible false

# additional configs: creating teams etc
## !!!EDIT BELOW!!! WHATEVER YOU ADD HERE, REMEMBER TO UNDO IN THE gamename:exit FUNCTION
#team add ...