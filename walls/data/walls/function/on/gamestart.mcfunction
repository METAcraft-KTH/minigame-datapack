# ============================================================
# walls:on/gamestart
# Called by: main:private/call/gamestart (once)
# Executor:  Server
#
# Runs ONCE: on the tick when superstate changes to 3.
# Full control is handed over to this minigame datapack.
# ============================================================

function walls:util/gamerules

# --- RESET STATE ---
#   0 = walls up, 1 = wall dropping, 2 = open fight, 3 = over
scoreboard players set ?phase walls.state 0
scoreboard players set ?match_timer walls.timer 0
scoreboard players set ?wall_step walls.state 0
scoreboard players set ?sudden_death walls.state 0
#   mid evoker bookkeeping: 0 = none, 1 = alive, 2 = just died
scoreboard players set ?evoker_state walls.state 0
scoreboard players set ?evoker_claimed walls.state 0
scoreboard players set ?next_evoker walls.timer 12000
#   how many defenders each side still has, for the "golem fell"
#   callout. Read from the world rather than assumed, so a golem that
#   failed to summon does not read as one that just died.
execute store result score ?it_golems walls.state if entity @e[type=iron_golem,tag=walls.golem.it]
execute store result score ?data_golems walls.state if entity @e[type=iron_golem,tag=walls.golem.data]
scoreboard players set ?golem_melee walls.timer 30
scoreboard players reset @a walls.respawn

# --- STATS ---
#   players without a score are left out of the outro leaderboard,
#   so only the people who were here at game start get a row
scoreboard players set @a[tag=!admin] walls.st.kills 0
scoreboard players set @a[tag=!admin] walls.st.cryst 0

# --- ARM TRIGGERS ---
advancement revoke @a only walls:kill_evoker
advancement revoke @a only walls:place_spawner_cow
advancement revoke @a only walls:place_spawner_zombie
advancement revoke @a only walls:place_spawner_skeleton

# --- TEAMS ---
#   no teamkilling for crystals. walls:end/finish puts these back.
team modify main.it friendlyFire false
team modify main.data friendlyFire false

# --- PLAYERS ---
function walls:player/set_spawnpoints
execute as @a[tag=!admin] run function walls:player/setup

# --- BOSSBARS ---
bossbar set walls:it players @a
bossbar set walls:it visible true
bossbar set walls:data players @a
bossbar set walls:data visible true
bossbar set walls:timer players @a
bossbar set walls:timer visible true

# --- SANITY CHECK ---
#   an empty golem selector reads as "that team lost", so the win check
#   only arms if walls:on/introstart really did place all four of them
scoreboard players set ?ready walls.state 0
execute store result score #n walls.temp if entity @e[type=iron_golem,tag=walls.golem]
execute if score #n walls.temp matches 4 run scoreboard players set ?ready walls.state 1
execute unless score #n walls.temp matches 4 run tellraw @a[tag=admin] {text:"[walls] expected 4 golems and did not find them — the win check is off, the match will run to the 30 minute backstop.",color:"red"}
