# ============================================================
# tnttag:state/ready/tick
# Called by: tnttag:on/gametick
# Executor:  Server
#
# 15-second ready phase with actionbar countdown.
# ============================================================

scoreboard players add ?phase_timer tnttag.timer 1

scoreboard players set #remaining tnttag.temp 300
scoreboard players operation #remaining tnttag.temp -= ?phase_timer tnttag.timer
scoreboard players operation #display tnttag.temp = #remaining tnttag.temp
scoreboard players add #display tnttag.temp 19
scoreboard players operation #display tnttag.temp /= #20 main.const
execute if score #display tnttag.temp matches ..0 run scoreboard players set #display tnttag.temp 0

title @a actionbar [{"text":"Round starts in ","color":"yellow"},{"score":{"name":"#display","objective":"tnttag.temp"}},{"text":"s","color":"yellow"}]

execute if score ?phase_timer tnttag.timer matches 300.. run function tnttag:state/play/enter
