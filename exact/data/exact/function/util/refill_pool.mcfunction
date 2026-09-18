# ============================================================
# exact:util/refill_pool
# Called by: exact:util/draw_task (when the pool runs dry)
# Executor:  Server
#
# All 30 tasks have been played. Put them all back so the
# elimination can keep running, reshuffled by the fact that
# draw_task pulls a random index out of the pool every round.
# ============================================================

data modify storage exact:tasks pool set value [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]

tellraw @a ["",{"text":"All 30 tasks have been played! ","color":"gold","bold":true},{"text":"Reshuffling the list and going again.","color":"yellow"}]
