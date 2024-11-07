## Called when a player the server joins in a different gamestate than before
scoreboard players operation @s GLOBAL.player_in_state =

## Reset logic
effect clear @s
clear @s
experience set @s 0 levels
experience set @s 0 points
effect give @s saturation infinite 0 true
