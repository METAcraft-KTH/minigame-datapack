# ============================================================
# mingle:state/pregame/tick
# Called by: mingle:_tick
# Executor:  Server
#
# 20-second pregame countdown.
# ============================================================

scoreboard players add ?phase_timer mingle.timer 1

scoreboard players operation #remaining mingle.temp = time.pregame mingle.temp
scoreboard players operation #remaining mingle.temp -= ?phase_timer mingle.timer
scoreboard players operation #display mingle.temp = #remaining mingle.temp
scoreboard players add #display mingle.temp 19
scoreboard players operation #display mingle.temp /= #20 main.const
execute if score #display mingle.temp matches ..0 run scoreboard players set #display mingle.temp 0

title @a actionbar [{"text":"Pregame: ","color":"yellow"},{"score":{"name":"#display","objective":"mingle.temp"}},{"text":"s","color":"yellow"}]

execute if score ?phase_timer mingle.timer >= time.pregame mingle.temp run function mingle:state/ingame_run/enter
