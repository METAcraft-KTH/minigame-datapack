# ============================================================
# Called by: main:team/lock
# Executor:  Online player who picked a random team
# 
# Joins the team with fewer online players, or a random
# one if both are equal.
# 
# ============================================================

execute store result score #data main.temp if entity @a[team=main.data]
execute store result score #it main.temp if entity @a[team=main.it]

execute if score #data main.temp < #it main.temp run scoreboard players set @s main.team 1
execute if score #data main.temp > #it main.temp run scoreboard players set @s main.team 2
execute if score #data main.temp = #it main.temp store result score @s main.team run random value 1..2

execute if score @s main.team matches 1 run team join main.data @s
execute if score @s main.team matches 1 run tellraw @s ["You were placed on team ",{text:"Data",color:"#e83d84"},"!"]
execute if score @s main.team matches 2 run team join main.it @s
execute if score @s main.team matches 2 run tellraw @s ["You were placed on team ",{text:"IT",color:"#cc99ff"},"!"]
