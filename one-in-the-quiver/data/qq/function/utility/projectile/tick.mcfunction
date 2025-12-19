## Process projectiles
execute as @e[type=arrow,tag=!qq.processed] run function qq:utility/projectile/process
execute as @e[type=trident,tag=!qq.processed] run function qq:utility/projectile/process

## tick functions for projectiles
execute as @e[type=trident] run function qq:utility/projectile/tick_trident