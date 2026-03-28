# ============================================================
# exact:state/ingame_wait/exit
# Transition from ingame_wait to next phase
# Check if round 16 has completed; if yes, end game
# Otherwise, increment round and return to ingame_task
# ============================================================

# Remove win tags from all players before next round
tag @a remove exact.win

# Check if last round (16) has just completed
execute if score ?round exact.state matches 15 run bossbar remove exact:timer
execute if score ?round exact.state matches 15 run function main:api/end_game

# Otherwise, advance to next round and restart task phase
execute unless score ?round exact.state matches 16 run scoreboard players add ?round exact.state 1
execute unless score ?round exact.state matches 16 run scoreboard players set ?phase exact.state 1
execute unless score ?round exact.state matches 16 run scoreboard players set ?phase_timer exact.timer 0
execute unless score ?round exact.state matches 16 run function exact:state/ingame_task/enter