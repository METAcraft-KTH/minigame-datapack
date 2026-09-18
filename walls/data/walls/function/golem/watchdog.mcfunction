# ============================================================
# walls:golem/watchdog
# Called by: walls:golem/tick, once a second during phases 0 and 1
# Executor:  Server
#
# The golems are invulnerable until the wall drops, so one that is
# missing before then cannot have died — something removed it, and it
# gets put back. Only runs while they are invulnerable: after the wall
# drops a dead golem has to stay dead.
#
# ### MAP CONFIG ### the four posts, same as walls:map/setup.
# ============================================================

execute store result score #before walls.temp if entity @e[type=iron_golem,tag=walls.golem]

execute positioned 29880 64 59880 unless entity @e[type=iron_golem,tag=walls.golem,distance=..16] run function walls:map/summon_golem {yaw:-45,side:"it",team:"main.it",name:"IT Golem",color:"#cc99ff"}
execute positioned 29880 64 60120 unless entity @e[type=iron_golem,tag=walls.golem,distance=..16] run function walls:map/summon_golem {yaw:-135,side:"it",team:"main.it",name:"IT Golem",color:"#cc99ff"}
execute positioned 30120 64 59880 unless entity @e[type=iron_golem,tag=walls.golem,distance=..16] run function walls:map/summon_golem {yaw:45,side:"data",team:"main.data",name:"Data Golem",color:"#e83d84"}
execute positioned 30120 64 60120 unless entity @e[type=iron_golem,tag=walls.golem,distance=..16] run function walls:map/summon_golem {yaw:135,side:"data",team:"main.data",name:"Data Golem",color:"#e83d84"}

execute store result score #after walls.temp if entity @e[type=iron_golem,tag=walls.golem]
execute if score #after walls.temp > #before walls.temp run tellraw @a[tag=admin] {text:"[walls] a defending golem had vanished and was put back.",color:"yellow"}

# a full set means the win check can be trusted again
execute if score #after walls.temp matches 4 run scoreboard players set ?ready walls.state 1
execute store result score ?it_golems walls.state if entity @e[type=iron_golem,tag=walls.golem.it]
execute store result score ?data_golems walls.state if entity @e[type=iron_golem,tag=walls.golem.data]
