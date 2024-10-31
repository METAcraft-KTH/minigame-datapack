# This function is called when the playable minigame actually begins.
scoreboard players set ?state GAMENAME.game 2

# various configs
function gamename:states/pregame/configure_gamerule

# initialize timer
execute store result bossbar gamename:timer max run scoreboard players get time.pregame GAMENAME.config
scoreboard players set ?timer GAMENAME.game 0

# tp everyone to the arena
tp @a @n[tag=GAMENAME.tp.arena]