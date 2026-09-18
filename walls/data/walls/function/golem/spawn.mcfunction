# ============================================================
# walls:golem/spawn
# Called by: walls:state/fight/enter, walls:golem/tick
# Executor:  Server
#
# ### MAP CONFIG ### mid of the map, on the old wall line.
# ============================================================

# book the next one first, so a skipped spawn does not stall the schedule
scoreboard players operation ?next_golem walls.timer = ?match_timer walls.timer
scoreboard players add ?next_golem walls.timer 3600

# one at a time — if the last one is still alive, this slot is skipped
execute if entity @e[type=iron_golem,tag=walls.golem] run return 0

summon iron_golem 30000 64 60000 {Tags:["walls.golem"],PersistenceRequired:1b,Glowing:1b,CustomName:{text:"Iron Golem",color:"gold"},CustomNameVisible:1b}

scoreboard players set ?golem_state walls.state 1
scoreboard players set ?golem_claimed walls.state 0

tellraw @a [{text:"An ",color:"gold"},{text:"Iron Golem",color:"gold",bold:true},{text:" has spawned in the middle — 15 💠 to whoever kills it.",color:"gold"}]
execute as @a at @s run playsound block.anvil_land master @s ~ ~ ~ 1 0.8
