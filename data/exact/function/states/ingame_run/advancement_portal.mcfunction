advancement revoke @s only exact:portal
execute unless score ?state exact.game matches 22 run return 0
execute if entity @s[gamemode=spectator] run return 0

gamemode spectator
title @s times 0 80 20
title @s title {"text":"ROUND COMPLETE","color":"green",bold:true}
title @s subtitle "Made it to the portal!"

execute store result score #playersdone exact.game if entity @a[tag=!admin,gamemode=spectator]
execute if score #playersdone exact.game matches ..9 run tellraw @a [{text:"00","color":"dark_gray"},{score:{name:"#playersdone",objective:"exact.game"},color:"gold"}," | ",{selector:"@s","color":"green"},{text:" has reached the portal!","color":"white"}]
execute if score #playersdone exact.game matches 10..99 run tellraw @a [{text:"0","color":"dark_gray"},{score:{name:"#playersdone",objective:"exact.game"},color:"gold"}," | ",{selector:"@s","color":"green"},{text:" has reached the portal!","color":"white"}]
execute if score #playersdone exact.game matches 100.. run tellraw @a [{text:"","color":"dark_gray"},{score:{name:"#playersdone",objective:"exact.game"},color:"gold"}," | ",{selector:"@s","color":"green"},{text:" has reached the portal!","color":"white"}]

execute store result storage exact:notdone points byte 1 if entity @a[tag=!admin,gamemode=adventure]
function score:add_points with storage exact:notdone

execute if score #playersdone exact.game matches 1 run function score:add_points {points:125}
execute if score #playersdone exact.game matches 2 run function score:add_points {points:100}
execute if score #playersdone exact.game matches 3 run function score:add_points {points:80}
execute if score #playersdone exact.game matches 4 run function score:add_points {points:60}
execute if score #playersdone exact.game matches 5 run function score:add_points {points:50}
execute if score #playersdone exact.game matches 6 run function score:add_points {points:40}
execute if score #playersdone exact.game matches 7 run function score:add_points {points:30}
execute if score #playersdone exact.game matches 8 run function score:add_points {points:20}
execute if score #playersdone exact.game matches 9 run function score:add_points {points:10}
execute if score #playersdone exact.game matches 10 run function score:add_points {points:5}