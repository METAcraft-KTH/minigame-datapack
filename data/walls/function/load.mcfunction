### Initialize scoreboards

# Creating objectives
scoreboard objectives add WALLS.game dummy
scoreboard objectives add WALLS.config dummy
execute unless score ?state WALLS.game matches -2147483648..2147483647 run scoreboard players set ?state WALLS.game -1
# the two global objectives are redeclared here, so the linter won't complain about "unknown objectives"
scoreboard objectives add GLOBAL dummy
scoreboard objectives add GLOBAL.player_left minecraft.custom:leave_game
scoreboard objectives add GLOBAL.time_alive minecraft.custom:minecraft.time_since_death
scoreboard players set 20 GLOBAL 20
scoreboard players set 60 GLOBAL 60

# unique game id
## !!!EDIT BELOW!!! MUST BE UNIQUE FROM ALL OTHER GAMES IN THE SAME TOURNAMENT!
scoreboard players set id WALLS.config 4

# gamestate (DO NOT change init and lobby)
scoreboard players set state.init WALLS.config -1
scoreboard players set state.lobby WALLS.config 0
## !!!EDIT BELOW!!! add more states as needed for the game.
scoreboard players set state.pregame WALLS.config 1
scoreboard players set state.r1.initial WALLS.config 2
scoreboard players set state.r1.wall_drop WALLS.config 3
scoreboard players set state.r1.deathmatch WALLS.config 4
scoreboard players set state.midgame WALLS.config 5
scoreboard players set state.r2.initial WALLS.config 6
scoreboard players set state.r2.wall_drop WALLS.config 7
scoreboard players set state.r2.deathmatch WALLS.config 8
scoreboard players set state.postgame WALLS.config 9

# how long each gamestate should last
## !!!EDIT BELOW!!! numbers are in ticks
scoreboard players set time.lobby WALLS.config 3600
scoreboard players set time.pregame WALLS.config 600
scoreboard players set time.r1.initial WALLS.config 7200
scoreboard players set time.r1.wall_drop WALLS.config 6000
scoreboard players set time.r1.deathmatch WALLS.config 2400
scoreboard players set time.midgame WALLS.config 600
scoreboard players set time.r2.initial WALLS.config 3600
scoreboard players set time.r2.wall_drop WALLS.config 3600
scoreboard players set time.r2.deathmatch WALLS.config 2400
scoreboard players set time.postgame WALLS.config 600

# bossbar
bossbar add walls:timer ""
bossbar set walls:timer visible false

# additional configs: creating teams etc
## !!!EDIT BELOW!!! WHATEVER YOU ADD HERE, REMEMBER TO UNDO IN THE walls:exit FUNCTION
function walls:add_team {name: "blue", displayName: "\"Blue\"", colour: "blue"}
function walls:add_team {name: "red", displayName: "\"Red\"", colour: "red"}
function walls:add_team {name: "green", displayName: "\"Green\"", colour: "green"}
function walls:add_team {name: "yellow", displayName: "\"Yellow\"", colour: "yellow"}


scoreboard objectives add WALLS.lava_point_x_dist dummy
scoreboard objectives add WALLS.lava_point_z_dist dummy
scoreboard objectives add WALLS.lava_timer dummy
scoreboard objectives add WALLS.lava_delay dummy
scoreboard objectives add WALLS.lava_delay_max dummy
scoreboard objectives add WALLS.lava_max_y dummy
scoreboard objectives add WALLS.tmp dummy
scoreboard objectives add WALLS.following dummy
scoreboard objectives add WALLS.persistent_data dummy

scoreboard objectives add WALLS.wall_length dummy
scoreboard objectives add WALLS.wall_height dummy
scoreboard objectives add WALLS.type dummy
scoreboard objectives add WALLS.ids dummy

scoreboard players set lava.point_x_dist WALLS.config 127
scoreboard players set lava.point_z_dist WALLS.config 127
scoreboard players set lava.timer WALLS.config 6000
scoreboard players set lava.delay WALLS.config 20
scoreboard players set lava.max_y WALLS.config 63

scoreboard players set wall_length WALLS.config 79
scoreboard players set wall_height WALLS.config 127
