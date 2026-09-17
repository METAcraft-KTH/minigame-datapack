# ============================================================
# Called by: main:team/tick
# Executor:  Player who used /trigger main.team_pick
# 
# main.team_pick values:
#   1 = Data
#   2 = IT
#   3 = Random (assigned in main:team/lock)
# 
# ============================================================

execute if score @s main.team_pick matches 1 run team join main.data @s
execute if score @s main.team_pick matches 1 run tellraw @s ["You joined team ",{text:"Data",color:"#e83d84"},"!"]

execute if score @s main.team_pick matches 2 run team join main.it @s
execute if score @s main.team_pick matches 2 run tellraw @s ["You joined team ",{text:"IT",color:"#cc99ff"},"!"]

execute if score @s main.team_pick matches 3 run team leave @s
execute if score @s main.team_pick matches 3 run tellraw @s ["You'll be placed on a ",{text:"random",color:"yellow"}," team when the next game starts."]

execute if score @s main.team_pick matches 1..3 run scoreboard players operation @s main.team = @s main.team_pick
scoreboard players reset @s main.team_pick
