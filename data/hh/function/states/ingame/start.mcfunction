# This function is called when the playable minigame actually begins.
scoreboard players set ?state hh.game 2

# various configs
function hh:states/pregame/configure_gamerule

# initialize timer
execute store result bossbar hh:timer max run scoreboard players get time.ingame hh.config
scoreboard players set ?timer hh.game 0

# tp everyone to the arena
tp @a @n[tag=hh.tp.arena]

execute as @a[tag=!admin] run attribute @s minecraft:max_health base set 1