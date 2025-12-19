execute store result storage survivalgames:temp range int 1 run scoreboard players get arena_radius SURVIVALGAMES.config
scoreboard players operation #chunkRange SURVIVALGAMES.tmp = arena_radius SURVIVALGAMES.config
scoreboard players set #10 SURVIVALGAMES.tmp 10
scoreboard players operation #chunkRange SURVIVALGAMES.tmp *= #10 SURVIVALGAMES.tmp
scoreboard players set #16 SURVIVALGAMES.tmp 16
scoreboard players operation #chunkRange SURVIVALGAMES.tmp /= #16 SURVIVALGAMES.tmp
scoreboard players operation #mod_range SURVIVALGAMES.tmp = #chunkRange SURVIVALGAMES.tmp
scoreboard players operation #mod_range SURVIVALGAMES.tmp %= #10 SURVIVALGAMES.tmp
scoreboard players operation #required_to_full SURVIVALGAMES.tmp = #10 SURVIVALGAMES.tmp
scoreboard players operation #required_to_full SURVIVALGAMES.tmp -= #mod_range SURVIVALGAMES.tmp
scoreboard players operation #chunkRange SURVIVALGAMES.tmp += #required_to_full SURVIVALGAMES.tmp
execute store result storage survivalgames:temp chunkrange int 1 run scoreboard players get #chunkRange SURVIVALGAMES.tmp
execute as @e[tag=SURVIVALGAMES.middle] at @s run function survivalgames:states/pregame/on_prepare_map with storage survivalgames:temp
