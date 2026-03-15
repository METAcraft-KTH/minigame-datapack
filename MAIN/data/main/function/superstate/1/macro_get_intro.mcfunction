# ============================================================
# Called by: main:superstate/1/go_to_state_2 (once)
# Executor:  Server
# 
# Grabs the coords & howtoplay from the minigame's intro config,
# and then calls the function that summons the camera entity.
# 
# ============================================================

$data modify storage main:temp coords set from storage main:intro $(namespace).camera_starting_coords
$data modify storage main:temp howtoplay set from storage main:intro $(namespace).howtoplay

function main:superstate/1/macro_summon_camera with storage main:temp

# calculate how many ticks we'll need to type out the game name
# i.e. when can we start showing howtoplay
$execute store result score ?how_many_characters_are_in_the_gamename main.temp run data get storage main:game $(namespace).gamename