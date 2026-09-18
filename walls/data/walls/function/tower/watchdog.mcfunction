# ============================================================
# walls:tower/watchdog
# Called by: walls:tower/tick, once a second during phases 0 and 1
# Executor:  Server
#
# The ravagers are invulnerable until the wall drops, so one that is
# missing before then cannot have died — something removed it, and it
# gets put back. Only runs while they are invulnerable: after the wall
# drops a dead ravager has to stay dead.
#
# ### MAP CONFIG ### the four posts, same as walls:map/setup.
# ============================================================

execute store result score #before walls.temp if entity @e[type=ravager,tag=walls.tower]

execute positioned 29880 64 59880 unless entity @e[type=ravager,tag=walls.tower,distance=..16] run function walls:map/summon_tower {yaw:-45,side:"it",team:"main.it",name:"IT Ravager",color:"#cc99ff"}
execute positioned 29880 64 60120 unless entity @e[type=ravager,tag=walls.tower,distance=..16] run function walls:map/summon_tower {yaw:-135,side:"it",team:"main.it",name:"IT Ravager",color:"#cc99ff"}
execute positioned 30120 64 59880 unless entity @e[type=ravager,tag=walls.tower,distance=..16] run function walls:map/summon_tower {yaw:45,side:"data",team:"main.data",name:"Data Ravager",color:"#e83d84"}
execute positioned 30120 64 60120 unless entity @e[type=ravager,tag=walls.tower,distance=..16] run function walls:map/summon_tower {yaw:135,side:"data",team:"main.data",name:"Data Ravager",color:"#e83d84"}

execute store result score #after walls.temp if entity @e[type=ravager,tag=walls.tower]
execute if score #after walls.temp > #before walls.temp run tellraw @a[tag=admin] {text:"[walls] a tower had vanished and was put back.",color:"yellow"}

# a full set means the win check can be trusted again
execute if score #after walls.temp matches 4 run scoreboard players set ?ready walls.state 1
execute store result score ?it_towers walls.state if entity @e[type=ravager,tag=walls.tower.it]
execute store result score ?data_towers walls.state if entity @e[type=ravager,tag=walls.tower.data]
