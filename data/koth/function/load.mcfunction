### Initialize scoreboards

# Creating objectives
scoreboard objectives add koth.game dummy
scoreboard objectives add koth.config dummy
scoreboard objectives add koth.display dummy
scoreboard objectives modify koth.display displayname "King of Three Hills"
scoreboard objectives modify koth.display numberformat blank
execute unless score ?state koth.game matches -2147483648..2147483647 run scoreboard players set ?state koth.game -1
# the two global objectives are redeclared here, so the linter won't complain about "unknown objectives"
scoreboard objectives add GLOBAL dummy
scoreboard objectives add GLOBAL.player_in_state dummy
scoreboard objectives add GLOBAL.player_left minecraft.custom:leave_game
scoreboard objectives add GLOBAL.time_alive minecraft.custom:minecraft.time_since_death
scoreboard players set 20 GLOBAL 20
scoreboard players set 60 GLOBAL 60

# unique game id
## !!!EDIT BELOW!!! MUST BE UNIQUE FROM ALL OTHER GAMES IN THE SAME TOURNAMENT!
scoreboard players set id koth.config 6

# gamestate (DO NOT change init and lobby)
scoreboard players set state.init koth.config -1
scoreboard players set state.lobby koth.config 0
## !!!EDIT BELOW!!! add more states as needed for the game.
scoreboard players set state.pregame koth.config 1
scoreboard players set state.ingame koth.config 2
scoreboard players set state.ingame_walldrop koth.config 3
scoreboard players set state.ingame_cp koth.config 4
scoreboard players set state.postgame koth.config 5

# how long each gamestate should last
## !!!EDIT BELOW!!! numbers are in ticks
scoreboard players set time.lobby koth.config 3600
scoreboard players set time.pregame koth.config 600
scoreboard players set time.ingame koth.config 12000
scoreboard players set time.ingame_walldrop koth.config 1200
scoreboard players set time.ingame_cp koth.config 10800
scoreboard players set time.postgame koth.config 600

# bossbar
bossbar add koth:timer "King of Three Hills"
bossbar set koth:timer visible false

# additional configs: creating teams etc
## !!!EDIT BELOW!!! WHATEVER YOU ADD HERE, REMEMBER TO UNDO IN THE koth:exit FUNCTION
#team add ...

team add koth.blue
team modify koth.blue color blue
team modify koth.blue friendlyFire false
team add koth.red
team modify koth.red color red
team modify koth.red friendlyFire false

scoreboard objectives add koth.cp dummy
scoreboard objectives add koth.cp.delta dummy