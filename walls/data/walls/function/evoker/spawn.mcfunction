# ============================================================
# walls:evoker/spawn
# Called by: walls:state/fight/enter, walls:evoker/tick
# Executor:  Server
#
# The mid bounty: one giant evoker, every 3 minutes, on the old wall
# line. Unlike the team defenders this one keeps its AI — it picks its
# own targets, throws fangs and summons vexes, and it is hostile to
# both teams. It drops nothing but XP: the totem is stripped by the
# loot table override in data/minecraft/loot_table/entities/evoker.json.
#
# ### MAP CONFIG ### mid of the map, on the old wall line.
# ============================================================

# book the next one first, so a skipped spawn does not stall the schedule
scoreboard players operation ?next_evoker walls.timer = ?match_timer walls.timer
scoreboard players add ?next_evoker walls.timer 3600

# one at a time — if the last one is still alive, this slot is skipped
execute if entity @e[type=evoker,tag=walls.evoker] run return 0

summon evoker 30000 64 60000 {Tags:["walls.evoker","walls.tmp_evoker"],PersistenceRequired:1b,Glowing:1b,CustomName:{text:"Evoker",color:"gold"},CustomNameVisible:1b}

# ### TUNING ### 100 HP and double size. Applied by command, not in the
# summon NBT, for the reason spelled out in walls:map/summon_tower.
attribute @n[type=evoker,tag=walls.tmp_evoker] max_health base set 100
attribute @n[type=evoker,tag=walls.tmp_evoker] scale base set 2
#   raising max_health leaves current health alone, so fill it up after
#   (an evoker's base is 24). See walls:map/summon_tower for why this is
#   a data merge and not just an instant_health effect.
data merge entity @n[type=evoker,tag=walls.tmp_evoker] {Health:100f}
effect give @n[type=evoker,tag=walls.tmp_evoker] instant_health 1 7 true
tag @n[type=evoker,tag=walls.tmp_evoker] remove walls.tmp_evoker

scoreboard players set ?evoker_state walls.state 1
scoreboard players set ?evoker_claimed walls.state 0

tellraw @a [{text:"An ",color:"gold"},{text:"Evoker",color:"gold",bold:true},{text:" has spawned in the middle — 15 💠 to whoever kills it.",color:"gold"}]
execute as @a at @s run playsound entity.evoker.prepare_summon master @s ~ ~ ~ 1 0.8
