# This function is called after lobby time ends, and we want to TP everyone to the arena.
scoreboard players set ?state qq.game 1

# various configs
function qq:states/pregame/configure_gamerule

# initialize timer
execute store result bossbar qq:timer max run scoreboard players get time.pregame qq.config
scoreboard players set ?timer qq.game 0

# set map
# TODO: give tag qq.tp.arena to whatever map is next depending on mode qq.config

# tp everyone to the arena
tp @a @n[tag=qq.tp.arena]

# put everyone in a team
team add qq.players "Players"
team modify qq.players nametagVisibility hideForOwnTeam
team modify qq.players seeFriendlyInvisibles false
team modify qq.players friendlyFire false
team join qq.players @a[tag=!admin]