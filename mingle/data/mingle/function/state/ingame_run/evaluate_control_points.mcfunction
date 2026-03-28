# ============================================================
# mingle:state/ingame_run/evaluate_control_points
# Called by: mingle:state/ingame_run/tick
# Executor:  Server
#
# Marks players near active control points and validates exact groups.
# ============================================================

tag @a remove mingle.in_cp
tag @a remove mingle.correct
scoreboard players set @a[tag=!admin] mingle.hud 0

scoreboard players set @e[type=marker,tag=mingle.cp,tag=!mingle.cp.disabled] mingle.temp 0

execute as @e[type=marker,tag=mingle.cp,tag=!mingle.cp.disabled] at @s store result score @s mingle.temp if entity @a[tag=!admin,gamemode=!spectator,distance=..4]

execute as @e[type=marker,tag=mingle.cp,tag=!mingle.cp.disabled] at @s run tag @a[tag=!admin,gamemode=!spectator,distance=..4] add mingle.in_cp
execute as @e[type=marker,tag=mingle.cp,tag=!mingle.cp.disabled] at @s run scoreboard players operation @a[tag=!admin,gamemode=!spectator,distance=..4] mingle.hud = @s mingle.temp
execute as @e[type=marker,tag=mingle.cp,tag=!mingle.cp.disabled] if score @s mingle.temp = ?target_group mingle.state at @s run tag @a[tag=!admin,gamemode=!spectator,distance=..4] add mingle.correct
