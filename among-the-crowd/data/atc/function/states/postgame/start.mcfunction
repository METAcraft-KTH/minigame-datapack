# This function is called when the playable part of the minigame ends.
function atc:states/postgame/gameover

scoreboard players set ?state atc.game 3
scoreboard players add #round atc.game 1

# initialize timer
bossbar set atc:timer color white
execute store result bossbar atc:timer max run scoreboard players get time.postgame atc.config
scoreboard players set ?timer atc.game 0

# tp everyone to the arena
#tp @a[tag=!admin] @n[tag=atc.tp.arena]

# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1
execute as @a[tag=!admin] run function atc:states/postgame/reset_player

stopwatch remove atc:pointticker
