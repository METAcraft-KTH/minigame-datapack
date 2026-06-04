# ============================================================
# Called by: main:private/call/gamestart (once)
# Executor:  Server
# 
# Runs ONCE: on the tick when superstate changes to 3,
# and the control is fully handed over to this
# minigame datapack.
# 
# ============================================================


# Reset per-match globals
scoreboard players set ?phase tnttag.state 0
scoreboard players set ?phase_timer tnttag.timer 0
scoreboard players set ?round tnttag.state 0
scoreboard players set ?match_timer tnttag.timer 0

# Reset per-player stats
scoreboard players set @a tnttag.stats.kills 0
scoreboard players set @a tnttag.stats.trigs 0
scoreboard players set @a tnttag.stats.laptime 0

# Arm sample advancement triggers
advancement revoke @a only tnttag:player_kill

# Enter 15s pre-round ready state
function tnttag:state/ready/enter
