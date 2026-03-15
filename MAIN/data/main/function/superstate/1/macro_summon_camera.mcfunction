# ============================================================
# Called by: main:superstate/1/macro_get_intro (once)
# Executor:  Server
# 
# Receives the coords for the camera entity,
# and summons it.
# 
# ============================================================

kill @e[tag=main.camera,type=block_display]
$tp @a $(coords)
$execute positioned $(coords) summon block_display run tag @s add main.camera
execute as @a at @s run spectate @n[tag=main.camera]