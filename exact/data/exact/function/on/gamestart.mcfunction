# ============================================================
# exact:on/gamestart
# Called by: main:private/call/gamestart (once)
# Executor:  Server
#
# Runs ONCE: on the tick when superstate changes to 3.
# Initialize all game variables and arm advancement triggers.
# ============================================================

# Initialize round counter and phase
scoreboard players set ?round exact.state 1
scoreboard players set ?task exact.state 0
scoreboard players set ?phase exact.state 0
scoreboard players set ?phase_timer exact.timer 0

# Mark all online players as having been present at game start
scoreboard players set @a exact.stats.wins 0
scoreboard players set @a exact.is_sneaking 0
scoreboard players set @a exact.sneakcount 0
tag @a remove exact.win
team leave @a[team=exact.temp]

# Fill the pool of tasks still to be played. exact:util/draw_task pops a
# random entry out of this each round. There are 30 tasks but only 15
# rounds, so each game plays a different random half of them.
data modify storage exact:tasks pool set value [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]

# Arm all advancement triggers for all 30 tasks
advancement revoke @a only exact:1
advancement revoke @a only exact:2
advancement revoke @a only exact:3
advancement revoke @a only exact:4
advancement revoke @a only exact:5
advancement revoke @a only exact:6
advancement revoke @a only exact:7
advancement revoke @a only exact:8
advancement revoke @a only exact:9
advancement revoke @a only exact:10
advancement revoke @a only exact:11
advancement revoke @a only exact:12
advancement revoke @a only exact:13
advancement revoke @a only exact:14
advancement revoke @a only exact:15
advancement revoke @a only exact:16
advancement revoke @a only exact:17
advancement revoke @a only exact:18
advancement revoke @a only exact:19
advancement revoke @a only exact:20
advancement revoke @a only exact:21
advancement revoke @a only exact:22
advancement revoke @a only exact:23
advancement revoke @a only exact:24
advancement revoke @a only exact:25
advancement revoke @a only exact:26
advancement revoke @a only exact:27
advancement revoke @a only exact:28
advancement revoke @a only exact:29
advancement revoke @a only exact:30

# Start with pregame phase
function exact:state/pregame/enter
