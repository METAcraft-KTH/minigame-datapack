# ============================================================
# fireball:api/start
# Called by: fireball:on/gamestart
# Executor:  Server
# ============================================================

function fireball:gameplay/make_teams
function fireball:gameplay/reset_platforms
function fireball:gameplay/tp_to_arena
function fireball:ball/kill_all
execute as @a[tag=!admin] run function fireball:gameplay/init_player

scoreboard players set #game_time fireball 1
#   set, not reset: game_tick compares these with "matches", and an
#   unset score fails every comparison it is given
scoreboard players set #fireball_count fireball 0
scoreboard players set #fireball_spawntime fireball 0

#   with only one team present the ball has nobody to bounce between,
#   so the last-team-standing check is skipped and the game runs to a
#   total wipe instead
scoreboard players set #2teams fireball 0
execute if entity @a[team=main.it] if entity @a[team=main.data] run scoreboard players set #2teams fireball 1
