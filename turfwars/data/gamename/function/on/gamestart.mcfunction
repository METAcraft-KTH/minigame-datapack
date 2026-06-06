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
scoreboard players set ?phase tf.state 0
scoreboard players set ?phase_timer tf.timer 0
scoreboard players set ?round tf.state 0
scoreboard players set ?match_timer tf.timer 0

# Reset per-player stats
scoreboard players set @a tf.stats.kills 0
scoreboard players set @a tf.stats.trigs 0
scoreboard players set @a tf.stats.laptime 0

# Arm sample advancement triggers
advancement revoke @a only tf:player_kill
advancement revoke @a only tf:consume_item

# Enter 15s pre-round ready state
function tf:state/ready/enter
