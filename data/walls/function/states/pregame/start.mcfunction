# This function is called after lobby time ends, and we want to TP everyone to the arena.
scoreboard players operation ?state WALLS.game = state.pregame WALLS.config

# various configs
function walls:states/pregame/configure_gamerule

# initialize timer
execute store result bossbar walls:timer max run scoreboard players get time.pregame WALLS.config
scoreboard players set ?timer WALLS.game 0

# tp everyone to the arena
