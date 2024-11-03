# This function is called when the playable part of the minigame ends.
scoreboard players set ?state hh.game 3

# initialize timer
execute store result bossbar hh:timer max run scoreboard players get time.postgame hh.config
scoreboard players set ?timer hh.game 0

# tp everyone to the arena
tp @a @n[tag=hh.tp.arena]

execute as @a[tag=!admin] run function hh:utility/remove_halfheart