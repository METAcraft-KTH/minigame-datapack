### this function runs every tick, as it is called by qq:tick with no conditions. do what you want with it.

# menu
function qq:utility/menu/tick

# projectile
function qq:utility/projectile/tick

# reload crossbow
execute as @a if predicate qq:reload_mainhand run item modify entity @s weapon.mainhand qq:charge
execute as @a if predicate qq:reload_offhand run item modify entity @s weapon.offhand qq:charge

# flyball
execute as @e[type=snowball,predicate=qq:is_flyball] at @s on origin run ride @s mount @n[type=snowball,predicate=qq:is_flyball]

# jump pad
execute as @e[tag=qq.jump_pad] at @s as @p[distance=..1.5,tag=onGround,predicate=qq:jump] run summon minecraft:wind_charge ~ ~ ~ {Motion:[0.0d,-0.1d,0.0d],acceleration_power:10.0d}

# spawnpoint
scoreboard players remove @a[scores={qq.rclickCooldown=1..}] qq.rclickCooldown 1
execute as @e[tag=qq.spawnpoint_preview] if items entity @s armor.chest diamond_chestplate at @s run function qq:utility/spawnpoint/create
execute as @a if predicate qq:holding_spawnpoint_placer at @e[tag=qq.spawnpoint] run particle flame ~ ~0.2 ~ 0 0 0 0 1 force @s
execute as @a if predicate qq:holding_spawnpoint_placer at @e[tag=qq.spawnpoint] positioned ^ ^ ^0.2 run particle soul_fire_flame ~ ~0.2 ~ 0 0 0 0 1 force @s

# target
execute as @e[type=marker,tag=TargetBlock] at @s run function qq:utility/misc/target/target_tick

# misc
execute as @e[tag=EasterEggBoat] unless predicate qq:boat_has_rider run kill @s

