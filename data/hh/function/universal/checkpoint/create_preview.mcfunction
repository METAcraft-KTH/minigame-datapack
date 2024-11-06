advancement revoke @s only hh:use_place_checkpoint
execute if score @s hh.rclickCooldown matches 1.. run scoreboard players set @s hh.rclickCooldown 2
execute if score @s hh.rclickCooldown matches 1.. run return 0
scoreboard players set @s hh.rclickCooldown 2
summon armor_stand ~ ~ ~ {Tags:["this","hh.checkpoint_preview"]}
item replace entity @n[tag=this] armor.head with player_head
execute if entity @s[type=player] align xz run tp @n[tag=this] ~.5 ~ ~.5 ~ 0

#data modify entity @n[tag=this] Rotation set from entity @s Rotation
#data modify entity @n[tag=this] Rotation set from entity @s Rotation
tag @n[tag=this] remove this