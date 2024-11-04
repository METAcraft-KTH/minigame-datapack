# This function is called when the playable minigame actually begins.
scoreboard players set ?state hh.game 2

# various configs
function hh:states/pregame/configure_gamerule

# initialize timer
execute store result bossbar hh:timer max run scoreboard players get time.ingame hh.config
scoreboard players set ?timer hh.game 0

# tp everyone to the arena
tp @a @n[tag=hh.tp.arena]

execute as @a[tag=!admin] run function hh:utility/set_halfheart

# reset scores
scoreboard players reset * hh.skip
scoreboard players reset * hh.totalDeaths
scoreboard players reset * hh.checkpointDeaths