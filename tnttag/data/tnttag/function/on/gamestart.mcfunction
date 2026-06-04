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

# reset advancements
advancement revoke @a only tnttag:punch

# Enter 15s pre-round ready state
function tnttag:state/pregame/enter
