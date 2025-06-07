## Called when a player the server joins in a different gamestate than before
scoreboard players set @s GLOBAL.player_in_state 1

## Reset logic
effect clear @s
experience set @s 0 levels
experience set @s 0 points