# ============================================================
# tf:state/ingame_run/evaluate_control_points
# Called by: tf:state/ingame_run/tick
# Executor:  Server
#
# Marks players near active control points and validates exact groups.
# ============================================================

tag @a remove tf.in_cp
tag @a remove tf.player.toofew
tag @a remove tf.player.correct
tag @a remove tf.player.toomany
scoreboard players set @a[tag=!admin] tf.hud 0

scoreboard players set @e[type=block_display,tag=tf.cp,tag=!tf.cp.disabled] tf.temp 0

execute as @e[type=block_display,tag=tf.cp,tag=!tf.cp.disabled] at @s store result score @s tf.temp if entity @a[tag=!admin,gamemode=!spectator,distance=..4]

# as cp, show all players in range how many players are in the group
execute as @e[type=block_display,tag=tf.cp,tag=!tf.cp.disabled] at @s run tag @a[tag=!admin,gamemode=!spectator,distance=..4] add tf.in_cp
execute as @e[type=block_display,tag=tf.cp,tag=!tf.cp.disabled] at @s run scoreboard players operation @a[tag=!admin,gamemode=!spectator,distance=..4] tf.hud = @s tf.temp

# apply tags accordingly
execute as @e[type=block_display,tag=tf.cp,tag=!tf.cp.disabled] if score @s tf.temp < ?target_group tf.state at @s run tag @a[tag=!admin,gamemode=!spectator,distance=..4] add tf.player.toofew
execute as @e[type=block_display,tag=tf.cp,tag=!tf.cp.disabled] if score @s tf.temp = ?target_group tf.state at @s run tag @a[tag=!admin,gamemode=!spectator,distance=..4] add tf.player.correct
execute as @e[type=block_display,tag=tf.cp,tag=!tf.cp.disabled] if score @s tf.temp > ?target_group tf.state at @s run tag @a[tag=!admin,gamemode=!spectator,distance=..4] add tf.player.toomany

# apply teams
team leave @a[tag=!tf.in_cp]
team join tf.glow.yellow @a[tag=tf.player.toofew]
team join tf.glow.green @a[tag=tf.player.correct]
team join tf.glow.red @a[tag=tf.player.toomany]