### Initialize scoreboards

# Creating objectives
scoreboard objectives add tnttag.game dummy
scoreboard objectives add tnttag.config dummy
execute unless score ?state tnttag.game matches -2147483648..2147483647 run scoreboard players set ?state tnttag.game -1
# the two global objectives are redeclared here, so the linter won't complain about "unknown objectives"
scoreboard objectives add GLOBAL dummy
scoreboard objectives add GLOBAL.player_in_state dummy
scoreboard objectives add GLOBAL.player_left minecraft.custom:leave_game
scoreboard objectives add GLOBAL.time_alive minecraft.custom:minecraft.time_since_death
scoreboard players set 20 GLOBAL 20
scoreboard players set 60 GLOBAL 60

# unique game id
## !!!EDIT BELOW!!! MUST BE UNIQUE FROM ALL OTHER GAMES IN THE SAME TOURNAMENT!
scoreboard players set id tnttag.config 1

# gamestate (DO NOT change init and lobby)
scoreboard players set state.init tnttag.config -1
scoreboard players set state.lobby tnttag.config 0
## !!!EDIT BELOW!!! add more states as needed for the game.
scoreboard players set state.pregame tnttag.config 1
scoreboard players set state.ingame_tag tnttag.config 21
scoreboard players set state.ingame_grace tnttag.config 22
scoreboard players set state.postgame tnttag.config 3

# how long each gamestate should last
## !!!EDIT BELOW!!! numbers are in ticks
scoreboard players set time.lobby tnttag.config 3600
scoreboard players set time.pregame tnttag.config 600
# these values are 60 seconds and 15 seconds respectively, only for the first round - they're set to shorter intervals at the end & again upon arena change.
scoreboard players set time.ingame_tag tnttag.config 1200
scoreboard players set time.ingame_grace tnttag.config 300
scoreboard players set time.postgame tnttag.config 600

# bossbar
bossbar add tnttag:timer ""
bossbar set tnttag:timer visible false

# additional configs: creating teams etc
## !!!EDIT BELOW!!! WHATEVER YOU ADD HERE, REMEMBER TO UNDO IN THE tnttag:exit FUNCTION

# see config readme
scoreboard players set round.max tnttag.config 15
scoreboard players set round.prot tnttag.config 2
scoreboard players set round.arena2 tnttag.config 6
scoreboard players set round.arena3 tnttag.config 11
scoreboard players set num.bomb tnttag.config 20
scoreboard players set num.prot tnttag.config 10
scoreboard players set num.survive tnttag.config 100
scoreboard players set num.risk tnttag.config 10
scoreboard players set num.gain tnttag.config 20
scoreboard players set ?round tnttag.game 0