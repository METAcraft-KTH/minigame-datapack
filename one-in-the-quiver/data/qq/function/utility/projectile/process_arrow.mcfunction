## Set no pickup and despawn after 5 seconds in ground
execute unless score arrowPickup qq.config matches 1.. run data merge entity @s {pickup:0b, life:1160s}