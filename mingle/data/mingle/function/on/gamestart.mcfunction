# ============================================================
# mingle:on/gamestart
# Called by: main:private/call/gamestart
# Executor:  Server
#
# Runs once when superstate changes to 3.
# ============================================================

scoreboard players set ?phase mingle.state 0
scoreboard players set ?phase_timer mingle.timer 0
scoreboard players set ?round mingle.state 0
scoreboard players set ?match_timer mingle.timer 0
scoreboard players set ?target_group mingle.state 0

scoreboard players set @a mingle.stats.wins 0
scoreboard players set @a mingle.stats.losses 0
scoreboard players set @a mingle.stats.streak 0
scoreboard players set @a mingle.hud 0

tag @a remove mingle.in_cp
tag @a remove mingle.player.correct
tag @a remove mingle.winner
tag @a remove mingle.loser

tag @e[type=marker,tag=mingle.cp] remove mingle.cp.disabled

execute as @a[tag=!admin] run gamemode adventure

function mingle:state/pregame/enter
