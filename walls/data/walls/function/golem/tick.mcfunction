# ============================================================
# walls:golem/tick
# Called by: walls:_tick
# Executor:  Server
#
# Keeps both bossbars in sync, drives the defenders' attacks,
# announces losses, and ends the game when one side runs out.
# ============================================================

# --- WATCHDOG ---
#   runs before the counting below, so a golem that despawned and was
#   put back never registers as one that fell
scoreboard players operation #tick20 walls.temp = ?match_timer walls.timer
scoreboard players operation #tick20 walls.temp %= #20 main.const
execute if score #tick20 walls.temp matches 0 if score ?phase walls.state matches 0..1 run function walls:golem/watchdog

# --- PIN THEM TO THEIR POSTS ---
#   a mob with no AI can still be shoved by players walking into it, so
#   anything that drifted off its anchor marker gets put back
execute as @e[type=iron_golem,tag=walls.golem] at @s unless entity @n[type=armor_stand,tag=walls.golem_anchor,distance=..0.3] run tp @s @n[type=armor_stand,tag=walls.golem_anchor]

# --- ATTACKS ---
#   driven from here because the golems are NoAI. See walls:map/summon_golem.
scoreboard players remove ?golem_melee walls.timer 1
execute if score ?golem_melee walls.timer matches ..0 run function walls:golem/melee

# --- COMBINED HEALTH PER SIDE ---
scoreboard players set #sum walls.temp 0
execute as @e[type=iron_golem,tag=walls.golem.it] run function walls:golem/add_health
scoreboard players operation #it_hp walls.state = #sum walls.temp

scoreboard players set #sum walls.temp 0
execute as @e[type=iron_golem,tag=walls.golem.data] run function walls:golem/add_health
scoreboard players operation #data_hp walls.state = #sum walls.temp

execute store result bossbar walls:it value run scoreboard players get #it_hp walls.state
execute store result bossbar walls:data value run scoreboard players get #data_hp walls.state

# --- "A GOLEM HAS FALLEN" ---
execute store result score #n walls.temp if entity @e[type=iron_golem,tag=walls.golem.it]
execute if score #n walls.temp < ?it_golems walls.state run function walls:golem/it_fell
scoreboard players operation ?it_golems walls.state = #n walls.temp

execute store result score #n walls.temp if entity @e[type=iron_golem,tag=walls.golem.data]
execute if score #n walls.temp < ?data_golems walls.state run function walls:golem/data_fell
scoreboard players operation ?data_golems walls.state = #n walls.temp

# --- WIN CHECK ---
#   only once the wall is down, and only while the golems are
#   known to have been placed, so an empty selector during setup
#   cannot hand somebody a free win
execute if score ?ready walls.state matches 1 if score ?phase walls.state matches 2 unless entity @e[type=iron_golem,tag=walls.golem.it] run function walls:end/win_data
execute if score ?ready walls.state matches 1 if score ?phase walls.state matches 2 unless entity @e[type=iron_golem,tag=walls.golem.data] run function walls:end/win_it
