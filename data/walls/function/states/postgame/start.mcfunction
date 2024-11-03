# This function is called when the playable part of the minigame ends.
scoreboard players operation ?state WALLS.game = state.lobby WALLS.config

# initialize timer
execute store result bossbar walls:timer max run scoreboard players get time.postgame WALLS.config
scoreboard players set ?timer WALLS.game 0

# tp everyone to the arena



bossbar set walls:timer color white
