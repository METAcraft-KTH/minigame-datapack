# ============================================================
# walls:econ/drop_at
# Called by: walls:econ/drop_death
# Executor:  Server
#
# Preconditions: #dx #dy #dz #dn walls.temp are set.
# summon needs literal coordinates, hence the macro hop.
# ============================================================

execute store result storage walls:tmp drop.x int 1 run scoreboard players get #dx walls.temp
execute store result storage walls:tmp drop.y int 1 run scoreboard players get #dy walls.temp
execute store result storage walls:tmp drop.z int 1 run scoreboard players get #dz walls.temp
execute store result storage walls:tmp drop.n int 1 run scoreboard players get #dn walls.temp

function walls:econ/drop_macro with storage walls:tmp drop
