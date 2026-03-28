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
scoreboard players set ?phase exact.state 0
scoreboard players set ?phase_timer exact.timer 0

# Mark all online players as having been present at game start
scoreboard players set @a exact.stats.wins 0
scoreboard players set @a exact.is_sneaking 0
scoreboard players set @a exact.sneakcount 0
tag @a remove exact.win
team leave @a[team=exact.temp]

# Arm all advancement triggers for all 16 rounds
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

# Start with pregame phase
function exact:state/pregame/enter
