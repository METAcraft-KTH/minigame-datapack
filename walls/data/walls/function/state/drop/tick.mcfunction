# ============================================================
# walls:state/drop/tick
# Called by: walls:_tick
# Executor:  Server
#
# Removes the bedrock wall one slice per tick, so a 256-block
# long wall does not land as a single lag spike.
#
# The wall is the X=30000 column, Z 59872..60128, from Y=-59 (just
# above the world's bedrock floor, which we leave alone) up to
# Y=200. Only bedrock is replaced, so terrain touching the wall
# survives. Each slice is well under the 32768 block command limit.
# ============================================================

scoreboard players add ?wall_step walls.state 1

execute if score ?wall_step walls.state matches 1 run fill 30000 -59 59872 30000 200 59923 air replace bedrock
execute if score ?wall_step walls.state matches 2 run fill 30000 -59 59924 30000 200 59975 air replace bedrock
execute if score ?wall_step walls.state matches 3 run fill 30000 -59 59976 30000 200 60027 air replace bedrock
execute if score ?wall_step walls.state matches 4 run fill 30000 -59 60028 30000 200 60079 air replace bedrock
execute if score ?wall_step walls.state matches 5 run fill 30000 -59 60080 30000 200 60128 air replace bedrock

execute as @a at @s run playsound entity.generic.explode master @s ~ ~ ~ 0.6 0.6
execute if score ?wall_step walls.state matches 5.. run function walls:state/fight/enter
