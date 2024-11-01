advancement revoke @s only qq:on_kill
execute unless score ?state qq.game = state.ingame qq.config run return 0

execute if score mode qq.config matches 0 run give @s arrow
execute if score mode qq.config matches 2 run give @s arrow

experience add @s 1 levels
effect give @s instant_health 1 9