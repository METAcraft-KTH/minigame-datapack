#action: Action to run afterwards.
function walls:helper/center_position
function walls:helper/set_axis_aligned_horisontal_rotation
scoreboard players operation @s WALLS.wall_length = wall_length WALLS.config
scoreboard players operation @s WALLS.wall_height = wall_height WALLS.config
scoreboard players set @s WALLS.type 0
$$(action)
