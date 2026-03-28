execute if score ?minigame_id main.state matches 2 run function score:add_points {points:30}
execute if score ?minigame_id main.state matches 2 run tellraw @s ["",{"text":"+30💎"}]
