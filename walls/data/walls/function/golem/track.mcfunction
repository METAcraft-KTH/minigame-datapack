# ============================================================
# walls:golem/track
# Called by: walls:golem/tick
# Executor:  The iron golem
# ============================================================

execute store result score #gx walls.state run data get entity @s Pos[0]
execute store result score #gy walls.state run data get entity @s Pos[1]
execute store result score #gz walls.state run data get entity @s Pos[2]
