# ============================================================
# tnttag:state/ingame_task/enter
# Called once when entering the task phase
# Set up the task for the current round (20 seconds = 400 ticks)
# Display task instructions in subtitle
# ============================================================

# Clear titles
title @a clear

# Reset players for the new round
effect clear @a[tag=!admin]
clear @a[tag=!admin]
team leave @a[tag=!admin]

# Round banner
scoreboard players add ?round tnttag.state 1
tellraw @a [{"text":"\nROUND ","color":"gold","bold":true},{"score":{"name":"?round","objective":"tnttag.state"}}]

# calculate how many TNTs & diamonds to give out
#   arena 1: 20%, 0-1 diamond
#   arena 2: 30%, 0-2 diamonds
#   arena 3: 35%, 1-2 diamonds
#   arena 4: 40%, 1-2 diamonds
execute if score ?round tnttag.state matches 1..5 run scoreboard players set ?tnt_percentage tnttag.state 20
execute if score ?round tnttag.state matches 6..10 run scoreboard players set ?tnt_percentage tnttag.state 30
execute if score ?round tnttag.state matches 11..15 run scoreboard players set ?tnt_percentage tnttag.state 35
execute if score ?round tnttag.state matches 16..20 run scoreboard players set ?tnt_percentage tnttag.state 40
execute if score ?round tnttag.state matches 1..5 store result score ?diamond_count tnttag.temp run random value 0..1
execute if score ?round tnttag.state matches 6..10 store result score ?diamond_count tnttag.temp run random value 0..2
execute if score ?round tnttag.state matches 11..20 store result score ?diamond_count tnttag.temp run random value 1..2
function tnttag:state/ingame_tag/assign_tnt/start
execute if score ?diamond_count tnttag.temp matches 1.. run function tnttag:state/ingame_tag/assign_tnt/start

team modify tnttag.has_tnt prefix ""
team modify tnttag.has_diamond prefix ""
tellraw @a ["TNT was given to ",{selector:"@a[team=tnttag.has_tnt]"},"."]
execute if entity @p[team=tnttag.has_diamond] run tellraw @a ["A diamond block was given to",{selector:"@a[team=tnttag.has_diamond]"},"."]
team modify tnttag.has_tnt prefix [{text:"[TNT] ",color:"white"}]
team modify tnttag.has_diamond prefix [{text:"[$] ",color:"white"}]

# round duration
scoreboard players set ?tag_duration tnttag.state 700

# evacuation rounds
execute if score ?round tnttag.state matches 5 run setblock 19958 23 60073 red_stained_glass
execute if score ?round tnttag.state matches 5 run fill 19956 27 60066 19960 33 60066 air destroy
execute if score ?round tnttag.state matches 6 run setblock 19958 23 60073 smooth_sandstone

execute if score ?round tnttag.state matches 10 run setblock 19968 -2 59866 red_stained_glass
execute if score ?round tnttag.state matches 10 run fill 19966 1 59868 19969 -1 59869 air destroy
execute if score ?round tnttag.state matches 11 run setblock 19968 -2 59866 brown_terracotta

execute if score ?round tnttag.state matches 15 run setblock 19975 12 59727 red_stained_glass
execute if score ?round tnttag.state matches 15 run fill 19974 20 59731 19977 20 59726 air destroy
execute if score ?round tnttag.state matches 16 run setblock 19975 12 59727 dark_oak_planks

execute if score ?round tnttag.state matches 5 run function tnttag:state/ingame_tag/evacuation_round
execute if score ?round tnttag.state matches 10 run function tnttag:state/ingame_tag/evacuation_round
execute if score ?round tnttag.state matches 15 run function tnttag:state/ingame_tag/evacuation_round

# bossbars
bossbar set tnttag:white visible true
bossbar set tnttag:red visible true
bossbar set tnttag:blue visible true
bossbar set tnttag:white name ""
bossbar set tnttag:red name ""
bossbar set tnttag:blue name ""
execute store result bossbar tnttag:white max run scoreboard players get ?tag_duration tnttag.state
execute store result bossbar tnttag:red max run scoreboard players get ?tag_duration tnttag.state
execute store result bossbar tnttag:blue max run scoreboard players get ?tag_duration tnttag.state

scoreboard players set ?phase_timer tnttag.timer 0
