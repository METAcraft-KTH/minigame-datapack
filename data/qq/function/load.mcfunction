### Initialize scoreboards

# Creating objectives
scoreboard objectives add qq.game dummy
scoreboard objectives add qq.config dummy
execute unless score ?state qq.game matches -2147483648..2147483647 run scoreboard players set ?state qq.game -1
scoreboard players add mode qq.config 0
scoreboard players add raySize qq.config 0
scoreboard objectives add qq.raycast dummy
scoreboard players set #100 qq.raycast 100
scoreboard players set #20 qq.raycast 20
scoreboard objectives add qq.Points dummy "Points"
# the two global objectives are redeclared here, so the linter won't complain about "unknown objectives"
scoreboard objectives add GLOBAL dummy
scoreboard objectives add GLOBAL.player_in_state dummy
scoreboard objectives add GLOBAL.player_left minecraft.custom:leave_game
scoreboard objectives add GLOBAL.time_alive minecraft.custom:minecraft.time_since_death
scoreboard players set 20 GLOBAL 20
scoreboard players set 60 GLOBAL 60

# unique game id
## !!!EDIT BELOW!!! MUST BE UNIQUE FROM ALL OTHER GAMES IN THE SAME TOURNAMENT!
scoreboard players set id qq.config 3

# gamestate (DO NOT change init and lobby)
scoreboard players set state.init qq.config -1
scoreboard players set state.lobby qq.config 0
## !!!EDIT BELOW!!! add more states as needed for the game.
scoreboard players set state.pregame qq.config 1
scoreboard players set state.ingame qq.config 2
scoreboard players set state.postgame qq.config 3

# how long each gamestate should last
## !!!EDIT BELOW!!! numbers are in ticks
scoreboard players set time.lobby qq.config 3600
scoreboard players set time.pregame qq.config 300
scoreboard players set time.ingame qq.config 4800
scoreboard players set time.postgame qq.config 300

# bossbar
bossbar add qq:timer ""
bossbar set qq:timer visible false

# additional configs: creating teams etc
## !!!EDIT BELOW!!! WHATEVER YOU ADD HERE, REMEMBER TO UNDO IN THE qq:exit FUNCTION
#team add ...
team add qq.yellow "Yellow"
team add qq.gold "Gold"
team add qq.red "Red"
team modify qq.yellow color yellow
team modify qq.gold color gold
team modify qq.red color red

scoreboard objectives add var dummy
scoreboard players set #20 var 20
scoreboard players set #60 var 60
scoreboard players set #80 var 80

scoreboard objectives add qq.rclickCooldown dummy
scoreboard objectives add qq.tridentInvis dummy
scoreboard objectives add qq.ray_particle dummy
scoreboard objectives add qq.timeout dummy