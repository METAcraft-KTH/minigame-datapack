execute if predicate qq:is_ray_arrow run function qq:utility/projectile/process_ray_arrow
execute unless predicate qq:is_ray_arrow run function qq:utility/projectile/process_arrow
execute if entity @s[type=minecraft:trident] run function qq:utility/projectile/process_trident

tag @s add qq.processed