### Initialize scoreboards

# Creating objectives
scoreboard objectives add tnt.game dummy
scoreboard objectives add tnt.config dummy
execute unless score ?state tnt.game matches -2147483648..2147483647 run scoreboard players set ?state tnt.game -1
# the two global objectives are redeclared here, so the linter won't complain about "unknown objectives"
scoreboard objectives add GLOBAL dummy
scoreboard objectives add GLOBAL.player_in_state dummy
scoreboard objectives add GLOBAL.player_left minecraft.custom:leave_game
scoreboard objectives add GLOBAL.time_alive minecraft.custom:minecraft.time_since_death
scoreboard players set 20 GLOBAL 20
scoreboard players set 60 GLOBAL 60

# unique game id
## !!!EDIT BELOW!!! MUST BE UNIQUE FROM ALL OTHER GAMES IN THE SAME TOURNAMENT!
scoreboard players set id tnt.config 1

# gamestate (DO NOT change init and lobby)
scoreboard players set state.init tnt.config -1
scoreboard players set state.lobby tnt.config 0
## !!!EDIT BELOW!!! add more states as needed for the game.
scoreboard players set state.pregame tnt.config 1
scoreboard players set state.ingame tnt.config 2
scoreboard players set state.postgame tnt.config 3

# how long each gamestate should last
## !!!EDIT BELOW!!! numbers are in ticks
scoreboard players set time.lobby tnt.config 3600
scoreboard players set time.pregame tnt.config 600
# these values are 60 seconds and 15 seconds respectively, only for the first round - they're set to shorter intervals at the end of each state.
scoreboard players set time.ingame_tag tnt.config 1200
scoreboard players set time.ingame_grace tnt.config 300
scoreboard players set time.postgame tnt.config 600

# bossbar
bossbar add tnt:timer ""
bossbar set tnt:timer visible false

# additional configs: creating teams etc
## !!!EDIT BELOW!!! WHATEVER YOU ADD HERE, REMEMBER TO UNDO IN THE tnt:exit FUNCTION
scoreboard players set round tnt.config 15