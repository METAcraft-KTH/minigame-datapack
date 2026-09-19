function fireball:gameplay/reset_platforms
function fireball:gameplay/tp_to_arena
function fireball:ball/kill_all
execute as @a[tag=!admin] run function fireball:gameplay/init_player

# init scores
scoreboard players set #game_time fireball 1
scoreboard players reset #fireball_count fireball
scoreboard players reset #fireball_spawntime fireball

# check if game started with only one team. Used for win conditi
scoreboard players set #2teams fireball 0
execute if entity @a[team=main.it] if entity @a[team=main.data] run scoreboard players set #2teams fireball 1