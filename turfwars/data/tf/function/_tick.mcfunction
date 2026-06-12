# ============================================================
# tf:_tick
# Called by: tf:on/gametick
# Executor:  Server
#
# Internal state dispatcher for the active minigame.
# ============================================================

scoreboard players add ?match_timer tf.timer 1

execute if score ?phase tf.state matches 0 run function tf:state/pregame/tick
execute if score ?phase tf.state matches 1 run function tf:state/ingame_wait/tick
execute if score ?phase tf.state matches 2 run function tf:state/ingame_run/tick
execute if score ?phase tf.state matches 3 run function tf:state/win/tick

# prevent players from crossing over team border
execute as @a[scores={tf.bounce_cd=1..}] run scoreboard players remove @s tf.bounce_cd 1
execute as @a[tag=!admin] store result score @s tf.x run data get entity @s Pos[0] 1
execute positioned 31000 65 59969 at @p[tag=!admin] store result score ! tf.x run data get entity @n[type=marker,tag=tf.border,distance=..500] Pos[0] 1
execute as @a[tag=!admin,team=tf.red] unless score @s tf.bounce_cd matches 1.. if score @s tf.x < ! tf.x run function tf:bounceback_red
execute as @a[tag=!admin,team=tf.blue] unless score @s tf.bounce_cd matches 1.. if score @s tf.x >= ! tf.x run function tf:bounceback_blue

effect give @a[tag=!admin] regeneration 3 1 true
effect give @a[tag=!admin] saturation 3 1 true
gamerule natural_health_regeneration false

# gain turf
execute if score ?turf tf.state matches 1.. run function tf:gainturf_red
execute if score ?turf tf.state matches ..-1 run function tf:gainturf_blue