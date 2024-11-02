# This function is called after lobby time ends, and we want to TP everyone to the arena.
scoreboard players set ?state hh.game 1

# various configs
function hh:states/pregame/configure_gamerule

# initialize timer
execute store result bossbar hh:timer max run scoreboard players get time.pregame hh.config
scoreboard players set ?timer hh.game 0

# tp everyone to the arena
tp @a @n[tag=hh.tp.arena]

# add team
team add hh.players "Players"
team modify hh.players friendlyFire false
team join hh.players @a[tag=!admin]