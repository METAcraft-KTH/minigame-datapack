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
scoreboard players set ?phase gamename.state 0
scoreboard players set ?phase_timer gamename.timer 0
scoreboard players set ?round gamename.state 0
scoreboard players set ?match_timer gamename.timer 0

# Reset per-player stats
scoreboard players set @a gamename.kills 0
scoreboard players set @a gamename.trigs 0

# Arm sample advancement triggers
advancement revoke @a only gamename:player_kill
advancement revoke @a only gamename:consume_item

# Enter 15s pre-round ready state
function gamename:state/ready/enter
