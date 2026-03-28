# ============================================================
# mingle:state/ingame_wait/enter
# Called by: mingle:state/ingame_run/tick
# Executor:  Server
#
# Resolves round winners and losers, then starts wait phase.
# ============================================================

scoreboard players set ?phase mingle.state 2
scoreboard players set ?phase_timer mingle.timer 0

tag @e[type=marker,tag=mingle.cp] add mingle.cp.disabled

tag @a remove mingle.winner
tag @a remove mingle.loser

execute as @a[tag=!admin,tag=mingle.correct] run tag @s add mingle.winner
execute as @a[tag=!admin,tag=!mingle.correct] run tag @s add mingle.loser

scoreboard players add @a[tag=mingle.winner] mingle.stats.wins 1
scoreboard players add @a[tag=mingle.loser] mingle.stats.losses 1
scoreboard players add @a[tag=mingle.winner] mingle.stats.streak 1
scoreboard players set @a[tag=mingle.loser] mingle.stats.streak 0

execute as @a[tag=mingle.winner] run function mingle:state/ingame_wait/reward_winner

execute as @a[tag=mingle.winner] run tellraw @s {"text":"Correct group! You win this round.","color":"green"}
execute as @a[tag=mingle.loser] run tellraw @s {"text":"Wrong group size or no control point. You lose this round.","color":"red"}

title @a title {"text":"Round Locked","color":"aqua","bold":true}
title @a subtitle [{"text":"Target was ","color":"yellow"},{"score":{"name":"?target_group","objective":"mingle.state"}}]
