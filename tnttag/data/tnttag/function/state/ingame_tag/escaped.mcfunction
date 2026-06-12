tag @s remove tnttag.not_evacuated
title @s actionbar {text:"Evacuated!",color:"green"}
function main:api/give_points {points:30,reason:"Evacuated"}