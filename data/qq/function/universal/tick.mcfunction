## this function will run every tick regardless of game.id

# jump pad
execute as @e[tag=qq.jump_pad] at @s as @p[distance=..1.5,tag=onGround,predicate=qq:jump] run summon minecraft:wind_charge ~ ~ ~ {Motion:[0.0d,-0.1d,0.0d],acceleration_power:10.0d}

# spawnpoint
scoreboard players remove @a[scores={qq.rclickCooldown=1..}] qq.rclickCooldown 1
execute as @e[tag=qq.spawnpoint_preview] if items entity @s armor.chest diamond_chestplate at @s run function qq:utility/spawnpoint/create
execute as @a if predicate qq:holding_spawnpoint_placer at @e[tag=qq.spawnpoint] run particle flame ~ ~0.2 ~ 0 0 0 0 1 force @s
execute as @a if predicate qq:holding_spawnpoint_placer at @e[tag=qq.spawnpoint] positioned ^ ^ ^0.2 run particle soul_fire_flame ~ ~0.2 ~ 0 0 0 0 1 force @s
