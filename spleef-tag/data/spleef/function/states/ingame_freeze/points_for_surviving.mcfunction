tellraw @s [{"text":"✔ Round ","color":"green","bold":true},{score:{name:"?round.number",objective:"spleef.game"}}," survived"]
function score:add_points {points:35}

execute if score #playersleft spleef.game matches 1 run tellraw @s {"text":"You were the LAST REMAINING player!! (Bonus points)","color":"gray"}
execute if score #playersleft spleef.game matches 2..10 run tellraw @s [{score:{name:"#playersleft",objective:"spleef.game"},color:"gray"}," players survived this round (top 10 survivors, bonus points)"]
execute if score #playersleft spleef.game matches 11.. run tellraw @s [{score:{name:"#playersleft",objective:"spleef.game"},color:"gray"}," players survived this round"]

execute if score #playersleft spleef.game matches 1 run function score:add_points {points:80}
execute if score #playersleft spleef.game matches 2 run function score:add_points {points:55}
execute if score #playersleft spleef.game matches 3 run function score:add_points {points:45}
execute if score #playersleft spleef.game matches 4 run function score:add_points {points:35}
execute if score #playersleft spleef.game matches 5 run function score:add_points {points:30}
execute if score #playersleft spleef.game matches 6 run function score:add_points {points:25}
execute if score #playersleft spleef.game matches 7 run function score:add_points {points:20}
execute if score #playersleft spleef.game matches 8 run function score:add_points {points:15}
execute if score #playersleft spleef.game matches 9 run function score:add_points {points:10}
execute if score #playersleft spleef.game matches 10 run function score:add_points {points:5}