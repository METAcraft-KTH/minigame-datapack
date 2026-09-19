# ============================================================
# fireball:gameplay/make_teams
# Called by: fireball:api/start
# Executor:  Server
#
# The event teams are locked in by main:team/lock back in
# superstate 2 and every non-admin has one, so this game does not
# pick teams — it only re-joins them, because the previous game's
# main:api/end_game emptied both teams on its way out.
#
#   main.team 1 = Data -> red nether brick platform
#   main.team 2 = IT   -> blackstone platform
# ============================================================

execute as @a[tag=!admin] if score @s main.team matches 1 run team join main.data @s
execute as @a[tag=!admin] if score @s main.team matches 2 run team join main.it @s
