### Initialize scoreboards

# Creating objectives
scoreboard objectives add tgttos.game dummy
scoreboard objectives add tgttos.config dummy
execute unless score ?state tgttos.game matches -2147483648..2147483647 run scoreboard players set ?state tgttos.game -1
# the two global objectives are redeclared here, so the linter won't complain about "unknown objectives"
scoreboard objectives add GLOBAL dummy
scoreboard objectives add GLOBAL.player_in_state dummy
scoreboard objectives add GLOBAL.player_left minecraft.custom:leave_game
scoreboard objectives add GLOBAL.time_alive minecraft.custom:minecraft.time_since_death
scoreboard players set 20 GLOBAL 20
scoreboard players set 60 GLOBAL 60

# unique game id
## !!!EDIT BELOW!!! MUST BE UNIQUE FROM ALL OTHER GAMES IN THE SAME TOURNAMENT!
scoreboard players set id tgttos.config 2

# gamestate (DO NOT change init and lobby)
scoreboard players set state.init tgttos.config -1
scoreboard players set state.lobby tgttos.config 0
## !!!EDIT BELOW!!! add more states as needed for the game.
scoreboard players set state.pregame tgttos.config 1
scoreboard players set state.ingame_run tgttos.config 22
scoreboard players set state.ingame_pause tgttos.config 23
scoreboard players set state.postgame tgttos.config 3

# how long each gamestate should last
## !!!EDIT BELOW!!! numbers are in ticks
scoreboard players set time.lobby tgttos.config 3600
scoreboard players set time.pregame tgttos.config 300
scoreboard players set time.ingame_run tgttos.config 2000
scoreboard players set time.ingame_pause tgttos.config 200
scoreboard players set time.postgame tgttos.config 600

# bossbar
bossbar add tgttos:timer ""
bossbar set tgttos:timer visible false

# additional configs: creating teams etc
## !!!EDIT BELOW!!! WHATEVER YOU ADD HERE, REMEMBER TO UNDO IN THE tgttos:exit FUNCTION
#team add ...
scoreboard objectives add tgttos.Y dummy
scoreboard objectives add tgttos.color dummy

execute unless entity @n[type=marker,tag=tgttos.tp.arena] run tellraw @a "debug: tgttos.tp.arena not found"
execute unless entity @n[type=marker,tag=tgttos.tp.2] run tellraw @a "debug: tgttos.tp.2 not found"
execute unless entity @n[type=marker,tag=tgttos.tp.3] run tellraw @a "debug: tgttos.tp.3 not found"
execute unless entity @n[type=marker,tag=tgttos.tp.4] run tellraw @a "debug: tgttos.tp.4 not found"
execute unless entity @n[type=marker,tag=tgttos.tp.5] run tellraw @a "debug: tgttos.tp.5 not found"