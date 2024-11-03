advancement revoke @s only qq:on_kill
execute unless score ?state qq.game = state.ingame qq.config run return 0
execute unless score game.id GLOBAL matches 2 run return 0

execute if score mode qq.config matches 0 run function qq:states/ingame/give_arrow
execute if score mode qq.config matches 2 run function qq:states/ingame/give_arrow

scoreboard players add @s qq.Points 1
experience add @s 1 levels
effect give @s instant_health 1 9