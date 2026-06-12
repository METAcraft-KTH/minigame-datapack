# ============================================================
# tf:state/ingame_run/enter
# Called by: tf:state/pregame/tick, tf:state/ingame_wait/tick
# Executor:  Server
#
# Starts a 30-second tf round and rolls target group size.
# ============================================================

scoreboard players set ?phase tf.state 1
scoreboard players set ?phase_timer tf.timer 0
scoreboard players add ?round tf.state 1
execute store result score ?target_group tf.state run random value 4..15

tag @a remove tf.in_cp
tag @a remove tf.player.correct
tag @a remove tf.winner
tag @a remove tf.loser

tag @e[type=block_display,tag=tf.cp] remove tf.cp.disabled

execute as @a[tag=!admin,gamemode=!spectator] run gamemode adventure

effect give @a[tag=!admin] speed 2 1 true

# give wools
execute as @a[tag=!admin] run function tf:state/ingame_run/get_wool