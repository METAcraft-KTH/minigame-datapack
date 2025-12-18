### Initialize scoreboards

# Creating objectives
scoreboard objectives add atc.game dummy
scoreboard objectives add atc.config dummy
scoreboard objectives add atc.fake_player_anger_timers dummy
execute unless score ?state atc.game matches -2147483648..2147483647 run scoreboard players set ?state atc.game -1
# the two global objectives are redeclared here, so the linter won't complain about "unknown objectives"
scoreboard objectives add GLOBAL dummy
scoreboard objectives add GLOBAL.player_in_state dummy
scoreboard objectives add GLOBAL.player_left minecraft.custom:leave_game
scoreboard objectives add GLOBAL.time_alive minecraft.custom:minecraft.time_since_death
scoreboard players set 20 GLOBAL 20
scoreboard players set 60 GLOBAL 60

# unique game id
## !!!EDIT BELOW!!! MUST BE UNIQUE FROM ALL OTHER GAMES IN THE SAME TOURNAMENT!
scoreboard players set id atc.config 2

# gamestate (DO NOT change init and lobby)
scoreboard players set state.init atc.config -1
scoreboard players set state.lobby atc.config 0
## !!!EDIT BELOW!!! add more states as needed for the game.
scoreboard players set state.pregame atc.config 1
scoreboard players set state.ingame atc.config 2
scoreboard players set state.postgame atc.config 3

# how long each gamestate should last
## !!!EDIT BELOW!!! numbers are in ticks
scoreboard players set time.lobby atc.config 3600
scoreboard players set time.pregame atc.config 600
scoreboard players set time.ingame atc.config 12000
scoreboard players set time.postgame atc.config 600

scoreboard players set fake_player_count atc.config 30
scoreboard players set fake_player_radius atc.config 30

# bossbar
bossbar add atc:timer ""
bossbar set atc:timer visible false

# additional configs: creating teams etc
## !!!EDIT BELOW!!! WHATEVER YOU ADD HERE, REMEMBER TO UNDO IN THE atc:exit FUNCTION
team add atc.seekers
team add atc.hiders
