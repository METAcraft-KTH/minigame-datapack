# ============================================================
# race:util/checkpoint/monitor_all
# Called by: race:state/play/tick (every tick)
# Executor:  Server
# ============================================================
# Check all players' checkpoint progress.

execute as @a[tag=race.playing,tag=!race.finished] run function race:util/checkpoint/check_player
