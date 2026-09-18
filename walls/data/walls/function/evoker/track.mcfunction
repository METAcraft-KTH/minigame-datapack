# ============================================================
# walls:evoker/track
# Called by: walls:evoker/tick
# Executor:  The evoker
# ============================================================

execute store result score #ex walls.state run data get entity @s Pos[0]
execute store result score #ey walls.state run data get entity @s Pos[1]
execute store result score #ez walls.state run data get entity @s Pos[2]
