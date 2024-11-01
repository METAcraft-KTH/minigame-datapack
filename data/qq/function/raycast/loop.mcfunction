# trail
execute as @a[tag=thisShooter] run function qq:raycast/particle_trail

# cut the raycast short if colliding with partial block
execute if block ~ ~ ~ #qq:partial run function qq:raycast/partial

scoreboard players remove .itt qq.raycast 1

scoreboard players operation .mod qq.raycast = .itt qq.raycast
scoreboard players operation .mod qq.raycast %= #20 qq.raycast
execute if score .mod qq.raycast matches 0 run function qq:raycast/sfx

# deflect?
execute if score .itt qq.raycast matches 1.. positioned ~-0.5 ~-0.5 ~-0.5 as @n[type=#qq:targets,tag=!thisOwner,tag=!hit,dx=0,tag=qq.BlockingWithShield] at @s anchored eyes positioned ^ ^ ^ run return run function qq:raycast/deflect


# test for hit targets
execute if score raySize qq.config matches 0 if score .itt qq.raycast matches 1.. positioned ~-0.15 ~-0.15 ~-0.15 as @e[type=#qq:targets,tag=!thisOwner,tag=!hit,dx=0] positioned ~-0.7 ~-0.7 ~-0.7 if entity @s[dx=0] run function qq:raycast/hit
execute if score raySize qq.config matches 1 if score .itt qq.raycast matches 1.. positioned ~-0.25 ~-0.25 ~-0.25 as @e[type=#qq:targets,tag=!thisOwner,tag=!hit,dx=0] positioned ~-0.5 ~-0.5 ~-0.5 if entity @s[dx=0] run function qq:raycast/hit
execute if score raySize qq.config matches 2 if score .itt qq.raycast matches 1.. positioned ~-0.5 ~-0.5 ~-0.5 as @e[type=#qq:targets,tag=!thisOwner,tag=!hit,dx=0] run function qq:raycast/hit

execute if score .itt qq.raycast matches 1.. if block ~ ~ ~ #qq:targets run function qq:raycast/blockhit


# loop
execute if score .itt qq.raycast matches 1.. if block ~ ~ ~ #qq:air positioned ^ ^ ^0.25 run function qq:raycast/loop