#id Lobby id
$scoreboard players add lobby$(id) SURVIVALGAMES.lobby_sizes 1
$function survivalgames:selector/update_spawnpoints {id: $(id)}
$tp @s @e[scores={SURVIVALGAMES.arena_id=$(id)},tag=SURVIVALGAMES.starting_point,sort=random,limit=1,tag=!SURVIVALGAMES.occupied]
$execute at @s unless entity @e[scores={SURVIVALGAMES.arena_id=$(id)},tag=SURVIVALGAMES.starting_point,sort=random,limit=1,tag=!SURVIVALGAMES.occupied] run tp @s @e[scores={SURVIVALGAMES.arena_id=$(id)},tag=SURVIVALGAMES.starting_point,sort=random,limit=1]
$execute at @n[tag=SURVIVALGAMES.middle,scores={SURVIVALGAMES.arena_id=$(id)}] rotated as @n[tag=SURVIVALGAMES.middle,scores={SURVIVALGAMES.arena_id=$(id)}] run spawnpoint @s ~ ~ ~ ~ ~
