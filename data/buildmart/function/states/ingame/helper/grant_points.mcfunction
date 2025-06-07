scoreboard players set #without_tag buildmart.game 0
scoreboard players set #with_tag buildmart.game 0
$execute as @a[tag=!admin,tag=!$(tag)] run scoreboard players add #without_tag buildmart.game 1
$execute as @a[tag=!admin,tag=$(tag)] run scoreboard players add #with_tag buildmart.game 1
for n, p in {1: 100, 2: 85, 3: 70, 4: 55, 5: 40, 6: 30, 7: 20, 8: 15, 9: 10, 10: 5}.items():
	execute if score #with_tag buildmart.game matches n run function score:add_points {points: p}

execute unless score #without_tag buildmart.game matches 0:
	execute store result storage buildmart:point_cache points int 1 run scoreboard players get #without_tag buildmart.game
	function score:add_points with storage buildmart:point_cache
