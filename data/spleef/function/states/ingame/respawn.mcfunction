# This function is called when the player presses respawn.

## !!!ADD BELOW!!! do whatever you need, e.g. forcing them to spectate an entity while waiting to respawn.
# remember that things like awarding kills is better done with advancements.
gamemode spectator
tp @s @n[tag=spleef.tp.arena]

# gib points
execute as @a[tag=!admin,gamemode=!spectator] run function score:add_points {points:2}