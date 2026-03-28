# ============================================================
# qq:_load
# Called by: minecraft:load
# Purpose: Initialize scoreboards and MAIN intro/outro config
# ============================================================

# Core objectives
scoreboard objectives add qq.game dummy
scoreboard objectives add qq.config dummy
scoreboard objectives add qq.raycast dummy
scoreboard objectives add qq.Points dummy "Points"
scoreboard objectives add qq.rclickCooldown dummy
scoreboard objectives add qq.tridentInvis dummy
scoreboard objectives add qq.ray_particle dummy
scoreboard objectives add qq.timeout dummy
scoreboard objectives add qq.in_state dummy
scoreboard objectives add qq.time_alive dummy
scoreboard objectives add var dummy

# Internal state defaults
execute unless score ?state qq.game matches -2147483648..2147483647 run scoreboard players set ?state qq.game -1
scoreboard players add mode qq.config 0
scoreboard players add raySize qq.config 0
scoreboard players set #100 qq.raycast 100
scoreboard players set #20 qq.raycast 20
scoreboard players set #20 var 20
scoreboard players set #60 var 60
scoreboard players set #80 var 80

# Game states
scoreboard players set state.init qq.config -1
scoreboard players set state.pregame qq.config 1
scoreboard players set state.ingame qq.config 2
scoreboard players set state.postgame qq.config 3

# State durations (ticks)
scoreboard players set time.pregame qq.config 300
scoreboard players set time.ingame qq.config 4800
scoreboard players set time.postgame qq.config 300

# Bossbar
bossbar add qq:timer ""
bossbar set qq:timer visible false

# Teams
team add qq.yellow "Yellow"
team add qq.gold "Gold"
team add qq.red "Red"
team modify qq.yellow color yellow
team modify qq.gold color gold
team modify qq.red color red

# Intro configuration consumed by MAIN
data modify storage main:intro qq.camera_starting_coords set value "59942 111 49947"
data modify storage main:intro qq.player_starting_coords set value "59937 100 50024"
data modify storage main:intro qq.howtoplay set value []
data modify storage main:intro qq.howtoplay append value ["One in the Quiver","Hit players to score points.","","Get one arrow after each kill.","Respawn quickly and rejoin the fight.",""]
data modify storage main:intro qq.howtoplay append value ["Modes rotate each round:","One in the Quiver -> Quake -> Trident Trick","","Win by getting the highest score.","Top players are shown in the outro.",""]

# Outro configuration consumed by MAIN
data modify storage main:outro qq.stats set value []
data modify storage main:outro qq.stats append value {objective:"qq.Points",name:"Top players:",sortby:">",prefix:"",suffix:" pts",numberformat:0}
