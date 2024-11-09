advancement revoke @s only qq:on_kill
execute unless score ?state qq.game = state.ingame qq.config run return 0
execute unless score game.id GLOBAL = id qq.config run return 0

execute if score mode qq.config matches 0 run function qq:states/ingame/give_arrow
execute if score mode qq.config matches 2 run function qq:states/ingame/give_arrow

scoreboard players add @s qq.Points 1
experience add @s 1 levels
effect give @s instant_health 1 9

# POINT SYSTEM
function score:add_points {points:25}
execute unless score @s qq.Points matches 20 run return 0
scoreboard players add #num20kills qq.Points 1
tellraw @a ["",{"selector":"@s","bold":true,"color":"yellow"},{"text":" is number ","color":"gold"},{"score":{"name":"#num20kills","objective":"qq.Points"}},{"text":" to reach 20 kills!","color":"gold"}]
function score:add_points {points:25}
execute if score #num20kills qq.Points matches ..7 run function score:add_points {points:25}
execute if score #num20kills qq.Points matches ..6 run function score:add_points {points:25}
execute if score #num20kills qq.Points matches ..5 run function score:add_points {points:25}
execute if score #num20kills qq.Points matches ..4 run function score:add_points {points:25}
execute if score #num20kills qq.Points matches ..3 run function score:add_points {points:25}
execute if score #num20kills qq.Points matches ..2 run function score:add_points {points:25}
execute if score #num20kills qq.Points matches ..1 run function score:add_points {points:25}