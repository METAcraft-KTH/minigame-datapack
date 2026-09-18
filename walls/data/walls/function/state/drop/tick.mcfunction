# ============================================================
# walls:state/drop/tick
# Called by: walls:_tick
# Executor:  Server
#
# ### MAP CONFIG ### must match walls:map/build_wall slice for slice.
#
# Takes the wall down one 32-block slice per tick. Two fills per
# slice, because clearing the whole column would leave a 1-block
# wide, 380-deep trench where the wall cut through the terrain:
#   Y 64..319  -> air, the crossing opens up
#   Y -59..63  -> stone, a flush seam at ground level that also
#                 stops anyone tunnelling along under the old wall
# Ground is Y=63 (players stand at 64). If the terrain along the
# wall line is not flat, this slices it level at 63.
# ============================================================

scoreboard players add ?wall_step walls.state 1

execute if score ?wall_step walls.state matches 1 run fill 30000 64 59872 30000 319 59903 air replace bedrock
execute if score ?wall_step walls.state matches 1 run fill 30000 -59 59872 30000 63 59903 stone replace bedrock
execute if score ?wall_step walls.state matches 2 run fill 30000 64 59904 30000 319 59935 air replace bedrock
execute if score ?wall_step walls.state matches 2 run fill 30000 -59 59904 30000 63 59935 stone replace bedrock
execute if score ?wall_step walls.state matches 3 run fill 30000 64 59936 30000 319 59967 air replace bedrock
execute if score ?wall_step walls.state matches 3 run fill 30000 -59 59936 30000 63 59967 stone replace bedrock
execute if score ?wall_step walls.state matches 4 run fill 30000 64 59968 30000 319 59999 air replace bedrock
execute if score ?wall_step walls.state matches 4 run fill 30000 -59 59968 30000 63 59999 stone replace bedrock
execute if score ?wall_step walls.state matches 5 run fill 30000 64 60000 30000 319 60031 air replace bedrock
execute if score ?wall_step walls.state matches 5 run fill 30000 -59 60000 30000 63 60031 stone replace bedrock
execute if score ?wall_step walls.state matches 6 run fill 30000 64 60032 30000 319 60063 air replace bedrock
execute if score ?wall_step walls.state matches 6 run fill 30000 -59 60032 30000 63 60063 stone replace bedrock
execute if score ?wall_step walls.state matches 7 run fill 30000 64 60064 30000 319 60095 air replace bedrock
execute if score ?wall_step walls.state matches 7 run fill 30000 -59 60064 30000 63 60095 stone replace bedrock
execute if score ?wall_step walls.state matches 8 run fill 30000 64 60096 30000 319 60127 air replace bedrock
execute if score ?wall_step walls.state matches 8 run fill 30000 -59 60096 30000 63 60127 stone replace bedrock

execute as @a at @s run playsound entity.generic.explode master @s ~ ~ ~ 0.6 0.6
execute if score ?wall_step walls.state matches 8.. run function walls:state/fight/enter
