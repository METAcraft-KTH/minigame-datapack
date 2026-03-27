# Called as a player to reset and set them up for playing.

clear @s
gamemode adventure @s
xp set @s 0 levels
xp set @s 0 points
advancement revoke @s everything

item replace entity @s armor.body with elytra
give @s iron_sword
effect clear @s

attribute @s block_break_speed base set 1.25
attribute @s max_health base set 40

effect give @s instant_health 1 255 true
effect give @s saturation 1 255 true

give @s wooden_sword
give @s wooden_axe
give @s wooden_pickaxe
give @s wooden_shovel
give @s firework_rocket 2
