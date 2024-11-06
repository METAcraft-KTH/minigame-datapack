## this function will run every tick regardless of game.id

# jump pad
execute as @e[tag=hh.jump_pad] at @s as @p[distance=..1.5,tag=onGround,predicate=hh:jump] run summon minecraft:wind_charge ~ ~ ~ {Motion:[0.0d,-0.1d,0.0d],acceleration_power:10.0d}

# checkpoint
scoreboard players remove @a[scores={hh.rclickCooldown=1..}] hh.rclickCooldown 1
execute as @e[tag=hh.checkpoint_preview] if items entity @s armor.chest diamond_chestplate at @s run function hh:utility/checkpoint/create
execute as @a if predicate hh:holding_checkpoint_placer at @e[tag=hh.checkpoint] run particle flame ~ ~0.2 ~ 0 0 0 0 1 force @s
execute as @a if predicate hh:holding_checkpoint_placer at @e[tag=hh.checkpoint] positioned ^ ^ ^0.2 run particle soul_fire_flame ~ ~0.2 ~ 0 0 0 0 1 force @s
