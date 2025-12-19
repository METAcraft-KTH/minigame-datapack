execute if score #pitch WALLS.tmp matches 45.. run return run data merge entity @s {Rotation:[0f,90f]}
execute if score #pitch WALLS.tmp matches ..-45 run return run data merge entity @s {Rotation:[0f,-90f]}
function metawalls:helper/set_axis_aligned_horisontal_rotation
