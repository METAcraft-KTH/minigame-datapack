# ============================================================
# tnttag:state/break/tick
# Called by: tnttag:on/gametick
# Executor:  Server
#
# 30-second break; loops to next round or ends match after round 3.
# ============================================================

scoreboard players add ?phase_timer tnttag.timer 1

scoreboard players set #remaining tnttag.temp 600
scoreboard players operation #remaining tnttag.temp -= ?phase_timer tnttag.timer
scoreboard players operation #display tnttag.temp = #remaining tnttag.temp
scoreboard players add #display tnttag.temp 19
scoreboard players operation #display tnttag.temp /= #20 main.const
execute if score #display tnttag.temp matches ..0 run scoreboard players set #display tnttag.temp 0

title @a actionbar [{"text":"Break: ","color":"aqua"},{"score":{"name":"#display","objective":"tnttag.temp"}},{"text":"s","color":"aqua"}]

execute if score ?phase_timer tnttag.timer matches 600.. if score ?round tnttag.state matches 3.. run function main:api/end_game
execute if score ?phase_timer tnttag.timer matches 600.. if score ?round tnttag.state matches ..2 run function tnttag:state/play/enter
