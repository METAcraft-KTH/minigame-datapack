# ============================================================
# gamename:state/play/tick
# Called by: gamename:on/gametick
# Executor:  Server
#
# 2-minute gameplay phase with actionbar countdown.
# ============================================================

scoreboard players add ?phase_timer gamename.timer 1

scoreboard players set #remaining gamename.temp 2400
scoreboard players operation #remaining gamename.temp -= ?phase_timer gamename.timer
scoreboard players operation #display gamename.temp = #remaining gamename.temp
scoreboard players add #display gamename.temp 19
scoreboard players operation #display gamename.temp /= #20 main.const
execute if score #display gamename.temp matches ..0 run scoreboard players set #display gamename.temp 0

title @a actionbar [{"text":"Gameplay: ","color":"green"},{"score":{"name":"#display","objective":"gamename.temp"}},{"text":"s remaining","color":"green"}]

execute if score ?phase_timer gamename.timer matches 2400.. run function gamename:state/break/enter
