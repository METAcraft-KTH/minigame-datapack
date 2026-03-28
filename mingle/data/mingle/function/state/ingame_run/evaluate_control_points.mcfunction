# ============================================================
# mingle:state/ingame_run/evaluate_control_points
# Called by: mingle:state/ingame_run/tick
# Executor:  Server
#
# Marks players near active control points and validates exact groups.
# ============================================================

tag @a remove mingle.in_cp
tag @a remove mingle.player.toofew
tag @a remove mingle.player.correct
tag @a remove mingle.player.toomany
scoreboard players set @a[tag=!admin] mingle.hud 0

scoreboard players set @e[type=block_display,tag=mingle.cp,tag=!mingle.cp.disabled] mingle.temp 0

execute as @e[type=block_display,tag=mingle.cp,tag=!mingle.cp.disabled] at @s store result score @s mingle.temp if entity @a[tag=!admin,gamemode=!spectator,distance=..4]

# as cp, show all players in range how many players are in the group
execute as @e[type=block_display,tag=mingle.cp,tag=!mingle.cp.disabled] at @s run tag @a[tag=!admin,gamemode=!spectator,distance=..4] add mingle.in_cp
execute as @e[type=block_display,tag=mingle.cp,tag=!mingle.cp.disabled] at @s run scoreboard players operation @a[tag=!admin,gamemode=!spectator,distance=..4] mingle.hud = @s mingle.temp

# apply tags accordingly
execute as @e[type=block_display,tag=mingle.cp,tag=!mingle.cp.disabled] if score @s mingle.temp < ?target_group mingle.state at @s run tag @a[tag=!admin,gamemode=!spectator,distance=..4] add mingle.player.toofew
execute as @e[type=block_display,tag=mingle.cp,tag=!mingle.cp.disabled] if score @s mingle.temp = ?target_group mingle.state at @s run tag @a[tag=!admin,gamemode=!spectator,distance=..4] add mingle.player.correct
execute as @e[type=block_display,tag=mingle.cp,tag=!mingle.cp.disabled] if score @s mingle.temp > ?target_group mingle.state at @s run tag @a[tag=!admin,gamemode=!spectator,distance=..4] add mingle.player.toomany

# apply teams
team leave @a[tag=!mingle.in_cp]
team join mingle.glow.yellow @a[tag=mingle.player.toofew]
team join mingle.glow.green @a[tag=mingle.player.correct]
team join mingle.glow.red @a[tag=mingle.player.toomany]