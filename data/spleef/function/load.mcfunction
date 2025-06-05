### Initialize scoreboards

# Creating objectives
scoreboard objectives add spleef.game dummy
scoreboard objectives add spleef.config dummy
execute unless score ?state spleef.game matches -2147483648..2147483647 run scoreboard players set ?state spleef.game -1
# the two global objectives are redeclared here, so the linter won't complain about "unknown objectives"
scoreboard objectives add GLOBAL dummy
scoreboard objectives add GLOBAL.player_in_state dummy
scoreboard objectives add GLOBAL.player_left minecraft.custom:leave_game
scoreboard objectives add GLOBAL.time_alive minecraft.custom:minecraft.time_since_death
scoreboard players set 20 GLOBAL 20
scoreboard players set 60 GLOBAL 60

# unique game id
## !!!EDIT BELOW!!! MUST BE UNIQUE FROM ALL OTHER GAMES IN THE SAME TOURNAMENT!
scoreboard players set id spleef.config 5

# gamestate (DO NOT change init and lobby)
scoreboard players set state.init spleef.config -1
scoreboard players set state.lobby spleef.config 0
## !!!EDIT BELOW!!! add more states as needed for the game.
scoreboard players set state.pregame spleef.config 1
scoreboard players set state.ingame_spleef spleef.config 21
scoreboard players set state.ingame_run spleef.config 22
scoreboard players set state.ingame_freeze spleef.config 23
scoreboard players set state.postgame spleef.config 3

# how long each gamestate should last
## !!!EDIT BELOW!!! numbers are in ticks
scoreboard players set time.lobby spleef.config 3600
scoreboard players set time.pregame spleef.config 400
scoreboard players set time.ingame_spleef spleef.config 600
scoreboard players set time.ingame_run spleef.config 100
scoreboard players set time.ingame_freeze spleef.config 100
scoreboard players set time.postgame spleef.config 600

# bossbar
bossbar add spleef:timer ""
bossbar set spleef:timer visible false

# additional configs: creating teams etc
## !!!EDIT BELOW!!! WHATEVER YOU ADD HERE, REMEMBER TO UNDO IN THE spleef:exit FUNCTION
#team add ...
scoreboard objectives add spleef.Y dummy
scoreboard objectives add spleef.blockmined minecraft.used:golden_pickaxe

execute positioned 50023 32 23 unless entity @n[type=marker,tag=spleef.tp.arena,distance=..1] run summon marker ~ ~ ~ {Tags:["spleef.tp.arena"]}