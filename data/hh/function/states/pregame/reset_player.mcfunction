## Called when a player the server joins in a different gamestate than before
scoreboard players set @s GLOBAL.player_in_state 1

## Reset logic
effect clear @s
clear @s
xp set @s 0 levels
xp set @s 0 points

tp @s @n[tag=hh.tp.arena]
execute at @s run spawnpoint @s ~ ~ ~ ~
gamemode adventure @s