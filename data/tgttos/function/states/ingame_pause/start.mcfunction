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
title @a times 0 80 20
title @a[tag=!admin,gamemode=!spectator] title {"text":"ROUND FAIL","color":"red","bold":true}
title @a[tag=!admin,gamemode=!spectator] subtitle "You did not reach the portal"
execute as @a[tag=!admin,gamemode=!spectator] run gamemode spectator

# if its the last round, just end game immediately
execute if score ?round.number tgttos.game matches 6 run return run function tgttos:states/postgame/start