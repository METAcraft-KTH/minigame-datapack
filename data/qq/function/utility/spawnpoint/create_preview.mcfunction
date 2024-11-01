advancement revoke @s only qq:use_place_spawnpoint
execute if score @s qq.rclickCooldown matches 1.. run scoreboard players set @s qq.rclickCooldown 2
execute if score @s qq.rclickCooldown matches 1.. run return 0
scoreboard players set @s qq.rclickCooldown 2
summon armor_stand ~ ~ ~ {Tags:["this","qq.spawnpoint_preview"]}
item replace entity @n[tag=this] armor.head with player_head
execute if entity @s[type=player] unless predicate qq:is_sneaking align xz run tp @n[tag=this] ~.5 ~ ~.5 ~ 0
execute if entity @s[type=player] if predicate qq:is_sneaking run rotate @n[tag=this] ~ ~

#data modify entity @n[tag=this] Rotation set from entity @s Rotation
#data modify entity @n[tag=this] Rotation set from entity @s Rotation
tag @n[tag=this] remove this