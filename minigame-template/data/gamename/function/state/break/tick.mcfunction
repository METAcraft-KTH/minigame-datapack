# ============================================================
# gamename:state/break/tick
# Called by: gamename:on/gametick
# Executor:  Server
#
# 30-second break; loops to next round or ends match after round 3.
# ============================================================

scoreboard players add ?phase_timer gamename.timer 1

scoreboard players set #remaining gamename.temp 600
scoreboard players operation #remaining gamename.temp -= ?phase_timer gamename.timer
scoreboard players operation #display gamename.temp = #remaining gamename.temp
scoreboard players add #display gamename.temp 19
scoreboard players operation #display gamename.temp /= #20 main.const
execute if score #display gamename.temp matches ..0 run scoreboard players set #display gamename.temp 0

title @a actionbar [{"text":"Break: ","color":"aqua"},{"score":{"name":"#display","objective":"gamename.temp"}},{"text":"s","color":"aqua"}]

execute if score ?phase_timer gamename.timer matches 600.. if score ?round gamename.state matches 3.. run function main:api/end_game
execute if score ?phase_timer gamename.timer matches 600.. if score ?round gamename.state matches ..2 run function gamename:state/play/enter
