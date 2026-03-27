## Called when a player the server joins in a different gamestate than before
## Reset logic
effect clear @s
clear @s
experience set @s 0 levels
experience set @s 0 points

tp @s @n[tag=spleef.tp.arena]