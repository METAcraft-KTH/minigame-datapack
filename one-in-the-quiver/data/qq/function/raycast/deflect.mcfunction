tag @a[tag=thisOwner] remove thisOwner
tag @s add thisOwner
tp @e[type=marker,tag=raycaster] ~ ~ ~
execute if score .itt qq.raycast matches 1.. if block ~ ~ ~ #qq:air positioned ^ ^ ^0.25 as @e[type=marker,tag=raycaster] run function qq:raycast/loop
tag @s remove thisOwner