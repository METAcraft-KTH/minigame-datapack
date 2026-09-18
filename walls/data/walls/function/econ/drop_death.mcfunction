# ============================================================
# walls:econ/drop_death
# Called by: walls:on/player/death
# Executor:  The victim, when nobody was credited
#
# Drops the 5 crystals on the last spot we saw them alive.
# ============================================================

execute unless score @s walls.x matches -2147483648..2147483647 run return 0

scoreboard players operation #dx walls.temp = @s walls.x
scoreboard players operation #dy walls.temp = @s walls.y
scoreboard players operation #dz walls.temp = @s walls.z
scoreboard players set #dn walls.temp 5
function walls:econ/drop_at
