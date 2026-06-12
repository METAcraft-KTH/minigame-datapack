# ============================================================
# Called by: _tick (each tick, state 0)
# Executor:  Server
# 
# Runs per tick until the event itself actually starts.
# 
# There is no timer in this superstate; instead, we wait
# for at least 15 players online before we start ticking
# down to Game 1.
# 
# ============================================================

# --- DONT LET PLAYERS DIE ---
#   tp players who fell off
execute as @a[tag=!admin] if predicate {condition:"entity_properties",entity:"this",predicate:{location:{position:{y:{max:0}}}}} run tp @s 0 64 50000
#   tp players who are too far away from spawn
execute positioned 0 0 50000 run tp @a[tag=!admin,distance=5000..] 0 64 50000
#   regen
effect give @a saturation 3 1 true
effect give @a instant_health 3 1 true
effect give @a resistance 3 4 true

# --- CHECK HOW MANY PLAYERS ONLINE ---
execute store result score #playercount main.temp if entity @a[tag=!admin]

# --- IF THAT NUMBER IS BIGGER THAN 15, GO TO SUPERSTATE 1
execute if score #playercount main.temp >= ?launch_wait_for_player_count main.const run function main:superstate/0/go_to_state_1