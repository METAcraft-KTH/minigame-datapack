## Called when a player the server joins in a different gamestate than before
scoreboard players set @s GLOBAL.player_in_state 1

## Reset logic
effect clear @s
effect give @s instant_health 1 9 true
xp set @s 0 levels
clear @s
gamemode adventure @s