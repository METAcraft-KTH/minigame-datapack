tag @s remove tnttag.not_evacuated
tellraw @s {text:"Evacuated!",color:"green"}
function score:add_points {points:30}