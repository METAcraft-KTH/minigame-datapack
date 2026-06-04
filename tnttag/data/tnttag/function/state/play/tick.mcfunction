# ============================================================
# tnttag:state/play/tick
# Called by: tnttag:on/gametick
# Executor:  Server
#
# 2-minute gameplay phase with actionbar countdown.
# ============================================================

scoreboard players add ?phase_timer tnttag.timer 1

scoreboard players set #remaining tnttag.temp 2400
scoreboard players operation #remaining tnttag.temp -= ?phase_timer tnttag.timer
scoreboard players operation #display tnttag.temp = #remaining tnttag.temp
scoreboard players add #display tnttag.temp 19
scoreboard players operation #display tnttag.temp /= #20 main.const
execute if score #display tnttag.temp matches ..0 run scoreboard players set #display tnttag.temp 0

title @a actionbar [{"text":"Gameplay: ","color":"green"},{"score":{"name":"#display","objective":"tnttag.temp"}},{"text":"s remaining","color":"green"}]

execute if score ?phase_timer tnttag.timer matches 2400.. run function tnttag:state/break/enter
