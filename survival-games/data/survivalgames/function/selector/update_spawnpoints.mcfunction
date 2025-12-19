#id The id
$execute as @e[scores={SURVIVALGAMES.arena_id=$(id)},tag=SURVIVALGAMES.starting_point] at @s if entity @p[distance=..1] run tag @s add SURVIVALGAMES.occupied
$execute as @e[scores={SURVIVALGAMES.arena_id=$(id)},tag=SURVIVALGAMES.starting_point] at @s unless entity @p[distance=..1] run tag @s remove SURVIVALGAMES.occupied
