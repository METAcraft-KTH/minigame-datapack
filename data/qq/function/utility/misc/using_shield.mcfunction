advancement revoke @s only qq:using_shield
execute unless score game.id GLOBAL = id qq.config run return 0
tag @s add qq.BlockingWithShield