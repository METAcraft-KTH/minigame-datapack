# ============================================================
# mingle:state/ingame_run/tick
# Called by: mingle:_tick
# Executor:  Server
#
# 30-second mingle phase with live control-point validation.
# ============================================================

scoreboard players add ?phase_timer mingle.timer 1

function mingle:state/ingame_run/evaluate_control_points

scoreboard players operation #remaining mingle.temp = time.ingame_run mingle.temp
scoreboard players operation #remaining mingle.temp -= ?phase_timer mingle.timer
scoreboard players operation #display mingle.temp = #remaining mingle.temp
scoreboard players add #display mingle.temp 19
scoreboard players operation #display mingle.temp /= #20 main.const
execute if score #display mingle.temp matches ..0 run scoreboard players set #display mingle.temp 0

title @a times 0 25 0
execute as @a[tag=!admin,gamemode=!spectator] run title @s title [{"score":{"name":"#display","objective":"mingle.temp"}},{"text":"s","color":"gold"}]
execute as @a[tag=!admin,gamemode=!spectator,tag=mingle.in_cp] run title @s subtitle [{"text":"On control point: ","color":"green"},{"score":{"name":"@s","objective":"mingle.hud"}},{"text":"/","color":"green"},{"score":{"name":"?target_group","objective":"mingle.state"}}]
execute as @a[tag=!admin,gamemode=!spectator,tag=!mingle.in_cp] run title @s subtitle [{"text":"Not on a control point","color":"red"},{"text":" | Target ","color":"yellow"},{"score":{"name":"?target_group","objective":"mingle.state"}}]

execute if score ?phase_timer mingle.timer >= time.ingame_run mingle.temp run function mingle:state/ingame_wait/enter
