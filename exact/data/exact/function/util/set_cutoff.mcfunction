# ============================================================
# exact:util/set_cutoff
# Called by: exact:state/ingame_task/enter (once per round)
# Executor:  Server
#
# Sets ?cutoff exact.state: the percentage of players allowed to
# finish the task before the round is cut short to 3 seconds
# remaining (see exact:state/ingame_task/check_cutoff).
#
# Lower = harsher, so the value ramps down as the game goes on.
# Keyed on ?round (game progress), NOT ?task (which is shuffled).
# Later lines win, so these read as "from round N onwards".
# ============================================================

scoreboard players set ?cutoff exact.state 90
execute if score ?round exact.state matches 4.. run scoreboard players set ?cutoff exact.state 80
execute if score ?round exact.state matches 7.. run scoreboard players set ?cutoff exact.state 70
execute if score ?round exact.state matches 10.. run scoreboard players set ?cutoff exact.state 60
execute if score ?round exact.state matches 13.. run scoreboard players set ?cutoff exact.state 50
