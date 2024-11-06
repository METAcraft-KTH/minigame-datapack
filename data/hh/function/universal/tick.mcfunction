## this function will run every tick regardless of game.id

# checkpoint
scoreboard players remove @a[scores={hh.rclickCooldown=1..}] hh.rclickCooldown 1
execute as @e[tag=hh.checkpoint_preview] if items entity @s armor.chest diamond_chestplate at @s run function hh:universal/checkpoint/create
execute as @a if predicate hh:holding_checkpoint_placer at @e[tag=hh.checkpoint] run particle flame ~ ~0.2 ~ 0 0 0 0 1 force @s
execute as @a if predicate hh:holding_checkpoint_placer at @e[tag=hh.checkpoint] positioned ^ ^ ^0.2 run particle soul_fire_flame ~ ~0.2 ~ 0 0 0 0 1 force @s
