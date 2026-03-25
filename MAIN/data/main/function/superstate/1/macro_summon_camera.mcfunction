# ============================================================
# Called by: main:superstate/1/macro_get_intro (once)
# Executor:  Server
# 
# Receives the coords for the camera entity,
# and summons it.
# 
# ============================================================

kill @e[tag=main.camera,type=block_display]
$tp @a $(camera_coords)
execute at @p summon block_display run data merge entity @s {Tags:["main.camera"],teleport_duration:12}
$execute as @n[tag=main.camera,type=block_display,] at @s run tp @s $(camera_coords)
#execute as @a at @s run spectate @n[tag=main.camera]