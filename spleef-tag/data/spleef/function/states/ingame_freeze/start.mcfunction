# This function is called when the playable minigame actually begins.
scoreboard players set ?state spleef.game 23

# various configs
function spleef:states/pregame/configure_gamerule

# initialize timer
scoreboard players set ?timer spleef.game 0

# tp everyone to the arena
#tp @a[tag=!admin] @n[tag=spleef.tp.arena]

execute as @a[tag=!admin] run function spleef:states/ingame_freeze/reset_player

# clear everyone's items!!
clear @a[tag=!admin]
title @a clear

# DELETE THE BLOCKS
function spleef:utility/game/blocks/destroy/run

# pause music
execute as @a at @s run function spleefmusic:badapple/pause