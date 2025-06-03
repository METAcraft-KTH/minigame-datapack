# This function is called after lobby time ends, and we want to TP everyone to the arena.
scoreboard players set ?state qq.game 1

# various configs
function qq:states/pregame/configure_gamerule

# new state, reset GLOBAL.player_in_state
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1

# initialize timer
execute store result bossbar qq:timer max run scoreboard players get time.pregame qq.config
scoreboard players set ?timer qq.game 0

# set map
function qq:states/pregame/setup_arena

# tp everyone to the arena
execute as @a[tag=!admin] run tp @s @e[tag=qq.spawnpoint,tag=qq.active_arena,limit=1,sort=random]

# put everyone in a team
team add qq.players "Players"
team modify qq.players nametagVisibility hideForOwnTeam
team modify qq.players seeFriendlyInvisibles false
team modify qq.players friendlyFire false
team join qq.players @a[tag=!admin]

# reset inventory but no arrows
effect give @a[tag=!admin] instant_health 2 99 true
execute as @a[tag=!admin] run function qq:states/ingame/reset_inventory
execute as @a[tag=!admin] run clear @s arrow

# reset scores
scoreboard players reset * qq.Points
xp set @a 0 levels
xp set @a 0 points
