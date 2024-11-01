# This function is called when the playable part of the minigame ends.
scoreboard players set ?state GAMENAME.game 3

# initialize timer
execute store result bossbar gamename:timer max run scoreboard players get time.postgame GAMENAME.config
scoreboard players set ?timer GAMENAME.game 0

# tp everyone to the arena
tp @a @n[tag=GAMENAME.tp.arena]