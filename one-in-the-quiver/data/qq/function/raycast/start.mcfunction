summon marker ~ ~ ~ {Tags:["raycaster"]}

# the shooter of the raycast
tag @s add thisShooter
# the owner of the raycast
tag @s add thisOwner

# sound effect
function qq:raycast/sfx

# distance in .25 blocks
scoreboard players set .itt qq.raycast 400

# reset count
scoreboard players set %count var 0

# start loop
execute as @e[type=marker,tag=raycaster] run function qq:raycast/loop

# hit count
#execute as @e[tag=hit] run scoreboard players add %count var 1

# display collateral
execute if score %count var matches 2.. run tellraw @a {"text":"COLLATERAL","bold":true,"color":"gold"}

# cleanup
#say @e[tag=hit]
tag @s remove thisOwner
tag @s remove thisShooter
tag @e remove hit
kill @e[type=marker,tag=raycaster]