function fireball:gameplay/reset_platforms
function fireball:gameplay/tp_to_arena
function fireball:ball/kill_all
execute as @a[tag=!admin] run function fireball:gameplay/init_player

scoreboard players set #game_time fireball 1
scoreboard players reset #fireball_count fireball
scoreboard players reset #fireball_spawntime fireball


scoreboard players set #2teams fireball 0
execute if entity @a[team=fireball.black] if entity @a[team=fireball.red] run scoreboard players set #2teams fireball 1