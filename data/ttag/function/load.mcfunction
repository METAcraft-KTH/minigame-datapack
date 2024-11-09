### Initialize scoreboards

# Creating objectives
scoreboard objectives add ttag.game dummy
scoreboard objectives add ttag.config dummy
execute unless score ?state ttag.game matches -2147483648..2147483647 run scoreboard players set ?state ttag.game -1
# the two global objectives are redeclared here, so the linter won't complain about "unknown objectives"
scoreboard objectives add GLOBAL dummy
scoreboard objectives add GLOBAL.player_in_state dummy
scoreboard objectives add GLOBAL.player_left minecraft.custom:leave_game
scoreboard objectives add GLOBAL.time_alive minecraft.custom:minecraft.time_since_death
scoreboard players set 20 GLOBAL 20
scoreboard players set 60 GLOBAL 60
scoreboard players set 100 GLOBAL 100

# unique game id
## !!!EDIT BELOW!!! MUST BE UNIQUE FROM ALL OTHER GAMES IN THE SAME TOURNAMENT!
scoreboard players set id ttag.config 1

# gamestate (DO NOT change init and lobby)
scoreboard players set state.init ttag.config -1
scoreboard players set state.lobby ttag.config 0
## !!!EDIT BELOW!!! add more states as needed for the game.
#scoreboard players set state.pregame ttag.config 1
scoreboard players set state.ingame_tag ttag.config 21
scoreboard players set state.ingame_grace ttag.config 22
scoreboard players set state.postgame ttag.config 3

# how long each gamestate should last
## !!!EDIT BELOW!!! numbers are in ticks
scoreboard players set time.lobby ttag.config 3600
scoreboard players set time.pregame ttag.config 600
# these values are 60 seconds and 15 seconds respectively, only for the first round - they're set to shorter intervals at the end & again upon arena change.
scoreboard players set time.ingame_tag ttag.config 1200
scoreboard players set time.ingame_grace ttag.config 200
scoreboard players set time.postgame ttag.config 600

# bossbar
bossbar add ttag:timer ""
bossbar set ttag:timer visible false

# additional configs: creating teams etc
## !!!EDIT BELOW!!! WHATEVER YOU ADD HERE, REMEMBER TO UNDO IN THE ttag:exit FUNCTION

team add ttag.tagged
team modify ttag.tagged color red
team modify ttag.tagged prefix [{"text":"[","color":"white","bold":true},{"text":"TNT","color":"red"},"] "]

# see config readme
scoreboard players set round.max ttag.config 15
scoreboard players set round.arena2 ttag.config 6
scoreboard players set round.arena3 ttag.config 12
scoreboard players set num.bomb ttag.config 20
scoreboard players set ?round ttag.game 0