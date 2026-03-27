# This function is called when the playable minigame actually begins.
scoreboard players set ?state spleef.game 23

# initialize timer
scoreboard players set ?timer spleef.game 0

# clear everyone's items!!
clear @a[tag=!admin]
title @a clear

bossbar remove spleef:timer

# pause music
execute as @a at @s run function spleefmusic:sans/pause