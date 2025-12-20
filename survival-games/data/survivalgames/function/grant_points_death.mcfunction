#range Range
$execute at @n[tag=SURVIVALGAMES.middle] as @a[gamemode=adventure,distance=..$(range)] run pointsystem addpoints @s 10


$execute at @n[tag=SURVIVALGAMES.middle] store result score #playercount SURVIVALGAMES.tmp if entity @a[distance=..$(range),gamemode=adventure]
execute if score #playercount SURVIVALGAMES.tmp matches 9 run pointsystem addpoints @s 30
execute if score #playercount SURVIVALGAMES.tmp matches 8 run pointsystem addpoints @s 50
execute if score #playercount SURVIVALGAMES.tmp matches 7 run pointsystem addpoints @s 70
execute if score #playercount SURVIVALGAMES.tmp matches 6 run pointsystem addpoints @s 90
execute if score #playercount SURVIVALGAMES.tmp matches 5 run pointsystem addpoints @s 120
execute if score #playercount SURVIVALGAMES.tmp matches 4 run pointsystem addpoints @s 150
execute if score #playercount SURVIVALGAMES.tmp matches 3 run pointsystem addpoints @s 180
execute if score #playercount SURVIVALGAMES.tmp matches 2 run pointsystem addpoints @s 220
execute if score #playercount SURVIVALGAMES.tmp matches 1 run pointsystem addpoints @s 260