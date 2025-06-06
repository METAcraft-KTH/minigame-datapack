# This function is called when the playable minigame actually begins.
scoreboard players set ?state tgttos.game 23

# various configs
function tgttos:states/pregame/configure_gamerule

# initialize timer
execute store result bossbar tgttos:timer max run scoreboard players get time.ingame_pause tgttos.config
scoreboard players set ?timer tgttos.game 0

# tp everyone to the arena
#tp @a[tag=!admin] @n[tag=tgttos.tp.arena]

# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1
execute as @a[tag=!admin] run function tgttos:states/ingame_pause/reset_player

# clear everyone's items!!
clear @a[tag=!admin]
title @a clear

# DELETE THE BLOCKS
function tgttos:utility/game/blocks/destroy/run

# pause music
execute as @a at @s run function tgttosmusic:badapple/pause