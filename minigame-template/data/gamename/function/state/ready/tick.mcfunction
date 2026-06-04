# ============================================================
# gamename:state/ready/tick
# Called by: gamename:on/gametick
# Executor:  Server
#
# 15-second ready phase with actionbar countdown.
# ============================================================

scoreboard players add ?phase_timer gamename.timer 1

scoreboard players set #remaining gamename.temp 300
scoreboard players operation #remaining gamename.temp -= ?phase_timer gamename.timer
scoreboard players operation #display gamename.temp = #remaining gamename.temp
scoreboard players add #display gamename.temp 19
scoreboard players operation #display gamename.temp /= #20 main.const
execute if score #display gamename.temp matches ..0 run scoreboard players set #display gamename.temp 0

title @a actionbar [{"text":"Round starts in ","color":"yellow"},{"score":{"name":"#display","objective":"gamename.temp"}},{"text":"s","color":"yellow"}]

execute if score ?phase_timer gamename.timer matches 300.. run function gamename:state/play/enter
