# ============================================================
# tgttos:on/gamestart
# Called by: main:private/call/gamestart (once)
# Executor:  Server
#
# Runs ONCE: on the tick when superstate changes to 3.
# Full control is handed over to this minigame datapack.
# ============================================================

function tgttos:util/gamerules

# --- RESET STATE ---
#   owner of each point: 0 = neutral, 1 = Data, 2 = IT.
#   once either team takes a point this never returns to 0.
scoreboard players set ?own1 tgttos.state 0
scoreboard players set ?own2 tgttos.state 0
#   capture progress, one signed bar per point, -200..200 ticks.
#   positive is Data's progress, negative is IT's. Whoever is alone
#   on the point pushes it their way at 1 per tick, so taking a point
#   off the other team means rewinding their 200 before building
#   your own — 10 seconds from neutral, 20 to flip an owned point.
scoreboard players set ?prog1 tgttos.state 0
scoreboard players set ?prog2 tgttos.state 0
scoreboard players set ?over tgttos.state 0

# --- TIMERS ---
#   3:00 each. Only runs down while that team holds BOTH points.
scoreboard players set ?t_data tgttos.timer 3600
scoreboard players set ?t_it tgttos.timer 3600
scoreboard players set ?match_timer tgttos.timer 0
scoreboard players set ?sec_timer tgttos.timer 0
scoreboard players set ?arrow_timer tgttos.timer 0
#   so the "10 seconds out" callout only fires once per team
scoreboard players set ?warn_data tgttos.state 0
scoreboard players set ?warn_it tgttos.state 0

# --- STATS ---
#   players without a score are left out of the outro leaderboard,
#   so only the people who were here at game start get a row
scoreboard players set @a[tag=!admin] tgttos.st.kills 0
scoreboard players set @a[tag=!admin] tgttos.st.caps 0
scoreboard players set @a[tag=!admin] tgttos.st.blocks 0

# --- TEAMS ---
#   no shooting your own bridge builder off it. tgttos:end/finish
#   puts these back.
team modify main.it friendlyFire false
team modify main.data friendlyFire false

# --- PLAYERS ---
function tgttos:player/set_spawnpoints
execute as @a[tag=!admin] run function tgttos:player/setup

# --- BOSSBARS ---
bossbar set tgttos:data players @a
bossbar set tgttos:data visible true
bossbar set tgttos:it players @a
bossbar set tgttos:it visible true
function tgttos:objective/bossbar

# --- SANITY CHECK ---
#   no markers means no capture ticks and no way to win, so say so
#   loudly rather than running a silent 15 minute stalemate
execute store result score #n tgttos.temp if entity @e[type=marker,tag=tgttos.point]
execute unless score #n tgttos.temp matches 2 run tellraw @a[tag=admin] {text:"[tgttos] expected 2 control point markers and did not find them — run /function tgttos:debug/rebuild_map.",color:"red"}
