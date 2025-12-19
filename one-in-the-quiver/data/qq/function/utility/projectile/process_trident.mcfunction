tag @s add thisTrident

## Set damage (does not work sadly)
#data merge entity @s {damage:100}

## Set color
execute at @s on origin if score @s qq.Points matches 5..9 run team join qq.yellow @n[type=minecraft:trident, tag=thisTrident]
execute at @s on origin if score @s qq.Points matches 10..14 run team join qq.gold @n[type=minecraft:trident, tag=thisTrident]
execute at @s on origin if score @s qq.Points matches 15.. run team join qq.red @n[type=minecraft:trident, tag=thisTrident]


tag @s remove thisTrident
