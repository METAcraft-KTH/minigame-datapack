# ============================================================
# mingle:state/ingame_wait/tick
# Called by: mingle:_tick
# Executor:  Server
#
# 10-second wait phase between rounds.
# ============================================================

scoreboard players add ?phase_timer mingle.timer 1

scoreboard players operation #remaining mingle.temp = time.ingame_wait mingle.temp
scoreboard players operation #remaining mingle.temp -= ?phase_timer mingle.timer
scoreboard players operation #display mingle.temp = #remaining mingle.temp
scoreboard players add #display mingle.temp 19
scoreboard players operation #display mingle.temp /= #20 main.const
execute if score #display mingle.temp matches ..0 run scoreboard players set #display mingle.temp 0

title @a actionbar [{"text":"Intermission: ","color":"aqua"},{"score":{"name":"#display","objective":"mingle.temp"}},{"text":"s Next target soon","color":"aqua"}]

execute if score ?phase_timer mingle.timer >= time.ingame_wait mingle.temp if score ?round mingle.state matches 15.. run function main:api/end_game
execute if score ?phase_timer mingle.timer >= time.ingame_wait mingle.temp if score ?round mingle.state matches ..14 run function mingle:state/ingame_run/enter
execute if score ?phase_timer mingle.timer >= time.ingame_wait mingle.temp if score ?round mingle.state matches 15.. run function main:api/end_game
execute if score ?phase_timer mingle.timer >= time.ingame_wait mingle.temp if score ?round mingle.state matches ..14 run function mingle:state/ingame_run/enter

# see win streak
execute as @a[tag=!admin] run title @s actionbar ["Current mingle streak: ",{score:{name:"@s",objective:"mingle.streak"},color:"gold"}]