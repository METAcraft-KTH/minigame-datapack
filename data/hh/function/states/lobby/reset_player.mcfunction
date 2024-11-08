## Called when a player the server joins in a different gamestate than before
scoreboard players set @s GLOBAL.player_in_state 1

## Reset logic
effect clear @s
clear @s
tp @s[tag=!admin] @n[tag=hh.tp.lobby]
gamemode adventure @s