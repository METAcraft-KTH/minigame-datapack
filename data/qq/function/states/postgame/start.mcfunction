# This function is called when the playable part of the minigame ends.
scoreboard players set ?state qq.game 3

# initialize timer
execute store result bossbar qq:timer max run scoreboard players get time.postgame qq.config
scoreboard players set ?timer qq.game 0

# tp everyone to the arena
tp @a @n[tag=qq.tp.arena]

# remove team
team remove qq.players

# clear effects
effect clear @a speed
effect clear @a weakness
effect clear @a invisibility