# ============================================================
# tf:on/gamestart
# Called by: main:private/call/gamestart
# Executor:  Server
#
# Runs once when superstate changes to 3.
# ============================================================

scoreboard players set ?phase tf.state 0
scoreboard players set ?phase_timer tf.timer 0
scoreboard players set ?round tf.state 0
scoreboard players set ?match_timer tf.timer 0
scoreboard players set ?target_group tf.state 0

scoreboard players set @a tf.stats.wins 0
scoreboard players set @a tf.stats.losses 0
scoreboard players set @a tf.stats.streak 0
scoreboard players set @a tf.hud 0

tag @a remove tf.in_cp
tag @a remove tf.player.correct
tag @a remove tf.winner
tag @a remove tf.loser

tag @e[type=block_display,tag=tf.cp] remove tf.cp.disabled

execute as @a[tag=!admin] run gamemode adventure

function tf:state/pregame/enter
