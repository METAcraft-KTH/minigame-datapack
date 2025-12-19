## Called when a player has GLOBAL.player_in_state undefined
scoreboard players set @s GLOBAL.player_in_state 1


tp @s @n[tag=qq.tp.lobby]
gamemode adventure @s
clear @s
effect clear @s
effect give @s saturation infinite 255 true
effect give @s regeneration infinite 1 true