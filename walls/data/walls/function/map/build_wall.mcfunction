# ============================================================
# walls:map/build_wall
# Called by: walls:map/setup, then itself once per tick
# Executor:  Server
#
# ### MAP CONFIG ###
# Raises the bedrock wall on the X=30000 line, Z 59872..60127,
# from Y=-59 (just above the world's own bedrock floor) all the way
# to the Y=319 build limit, so nobody can pillar over the top or
# pearl through it. It replaces everything in that column, terrain
# included — walls:state/drop/tick puts a walkable seam back.
#
# One 32-block slice per tick. Doing all 256 at once is ~97k block
# changes and a visible lag spike; spread out it lands during the
# intro cutscene where nobody is looking.
# ============================================================

scoreboard players add ?build_step walls.state 1

execute if score ?build_step walls.state matches 1 run fill 30000 -59 59872 30000 319 59903 bedrock
execute if score ?build_step walls.state matches 2 run fill 30000 -59 59904 30000 319 59935 bedrock
execute if score ?build_step walls.state matches 3 run fill 30000 -59 59936 30000 319 59967 bedrock
execute if score ?build_step walls.state matches 4 run fill 30000 -59 59968 30000 319 59999 bedrock
execute if score ?build_step walls.state matches 5 run fill 30000 -59 60000 30000 319 60031 bedrock
execute if score ?build_step walls.state matches 6 run fill 30000 -59 60032 30000 319 60063 bedrock
execute if score ?build_step walls.state matches 7 run fill 30000 -59 60064 30000 319 60095 bedrock
execute if score ?build_step walls.state matches 8 run fill 30000 -59 60096 30000 319 60127 bedrock

execute if score ?build_step walls.state matches ..7 run schedule function walls:map/build_wall 1t replace
