# ============================================================
# walls:player/tick
# Called by: walls:_tick
# Executor:  Server
# ============================================================

# --- REMEMBER WHERE EVERYONE IS ---
#   MAIN only tells us about a death on the following tick, by which
#   point the victim has already respawned, so the last position we
#   saw them alive in is the only death position we get.
execute as @a[tag=!admin,gamemode=survival] store result score @s walls.x run data get entity @s Pos[0]
execute as @a[tag=!admin,gamemode=survival] store result score @s walls.y run data get entity @s Pos[1]
execute as @a[tag=!admin,gamemode=survival] store result score @s walls.z run data get entity @s Pos[2]

# --- RESPAWN QUEUE ---
execute as @a[scores={walls.respawn=1..}] run function walls:player/tick_dead

# --- XP TOKENS ---
execute as @a[tag=!admin] if items entity @s container.* experience_bottle[custom_data~{walls_xp:1b}] run function walls:econ/redeem_xp

# --- DARKNESS ---
#   an angry warden blinds everyone within 20 blocks, which makes the
#   whole endgame unplayable. delete this line if you want it back.
effect clear @a[tag=!admin] darkness
