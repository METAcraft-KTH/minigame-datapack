# ============================================================
# mingle:state/ingame_run/enter
# Called by: mingle:state/pregame/tick, mingle:state/ingame_wait/tick
# Executor:  Server
#
# Starts a 30-second mingle round and rolls target group size.
# ============================================================

scoreboard players set ?phase mingle.state 1
scoreboard players set ?phase_timer mingle.timer 0
scoreboard players add ?round mingle.state 1
execute store result score ?target_group mingle.state run random value 2..6

tag @a remove mingle.in_cp
tag @a remove mingle.player.correct
tag @a remove mingle.winner
tag @a remove mingle.loser

tag @e[type=block_display,tag=mingle.cp] remove mingle.cp.disabled

execute as @a[tag=!admin,gamemode=!spectator] run gamemode adventure

effect give @a[tag=!admin] speed 2 1 true

# give wools
execute as @a[tag=!admin] run function mingle:state/ingame_run/get_wool