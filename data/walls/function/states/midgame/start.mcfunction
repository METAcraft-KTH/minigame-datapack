# This function is called after lobby time ends, and we want to TP everyone to the arena.
scoreboard players operation ?state WALLS.game = state.midgame WALLS.config

# initialize timer
execute store result bossbar walls:timer max run scoreboard players get time.midgame WALLS.config
scoreboard players set ?timer WALLS.game 0

# tp everyone to the arena


bossbar set walls:timer color white
