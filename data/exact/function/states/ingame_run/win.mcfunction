advancement revoke @s only exact:portal
execute unless score ?state exact.game matches 22 run return 0
execute if entity @s[gamemode=spectator] run return 0

tag @s add exact.done
clear @s

title @s times 0 60 20
title @s title {"text":"COMPLETE","color":"green",bold:true}

execute store result score #playersdone exact.game if entity @a[tag=!admin,tag=exact.done]
execute if score #playersdone exact.game matches ..9 run tellraw @a [{text:"00","color":"dark_gray"},{score:{name:"#playersdone",objective:"exact.game"},color:"gold"}," | ",{selector:"@s","color":"green"},{text:" did as told!","color":"white"}]
execute if score #playersdone exact.game matches 10..99 run tellraw @a [{text:"0","color":"dark_gray"},{score:{name:"#playersdone",objective:"exact.game"},color:"gold"}," | ",{selector:"@s","color":"green"},{text:" did as told!","color":"white"}]
execute if score #playersdone exact.game matches 100.. run tellraw @a [{text:"","color":"dark_gray"},{score:{name:"#playersdone",objective:"exact.game"},color:"gold"}," | ",{selector:"@s","color":"green"},{text:" did as told!","color":"white"}]

execute if score #playersdone exact.game matches 1 run function score:add_points {points:35}
execute if score #playersdone exact.game matches 2..3 run function score:add_points {points:25}
execute if score #playersdone exact.game matches 4..5 run function score:add_points {points:20}
execute if score #playersdone exact.game matches 6..10 run function score:add_points {points:15}
execute if score #playersdone exact.game matches 11..20 run function score:add_points {points:10}
execute if score #playersdone exact.game matches 21.. run function score:add_points {points:5}