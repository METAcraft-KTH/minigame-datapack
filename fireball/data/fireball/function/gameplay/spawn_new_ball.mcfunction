# warn-off target-selector-no-dimension
execute at @n[tag=fireball.arena_center,type=marker] run function fireball:ball/spawn with storage fireball:config
scoreboard players add #fireball_count fireball 1
scoreboard players set #fireball_spawntime fireball 0