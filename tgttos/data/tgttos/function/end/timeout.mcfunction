# ============================================================
# tgttos:end/timeout
# Called by: tgttos:_tick (once, at 15 minutes)
# Executor:  Server
#
# The backstop. A match where neither side ever holds both
# points at once has no natural end, so it is decided on which
# team got further through their 3:00 — i.e. who held the map
# for longer in total.
# ============================================================

tellraw @a {text:"15 minutes. The match is decided on objective time.",color:"yellow"}

execute if score ?t_data tgttos.timer < ?t_it tgttos.timer run function tgttos:end/win_data
execute if score ?t_it tgttos.timer < ?t_data tgttos.timer run function tgttos:end/win_it
execute if score ?t_data tgttos.timer = ?t_it tgttos.timer run function tgttos:end/draw
