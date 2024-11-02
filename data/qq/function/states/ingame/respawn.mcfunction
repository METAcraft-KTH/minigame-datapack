# This function is called when the player presses respawn.

## !!!ADD BELOW!!! do whatever you need, e.g. forcing them to spectate an entity while waiting to respawn.
# remember that things like awarding kills is better done with advancements.

execute if entity @s[gamemode=creative] run return 0

## Spectate
#gamemode spectator @s
execute at @s run spectate @n[tag=spectate] @s

## Inventory
clear @s
effect give @s saturation infinite 255 true
effect give @s regeneration infinite 1 true

# One in the Quiver
execute if score mode qq.config matches 0 run item replace entity @s hotbar.0 with bow
execute if score mode qq.config matches 0 run item replace entity @s hotbar.1 with stone_sword[unbreakable={show_in_tooltip:false}]
execute if score mode qq.config matches 0 run item replace entity @s hotbar.8 with arrow

# Quake
execute if score mode qq.config matches 1 run function qq:give/quake_crossbow
execute if score mode qq.config matches 1 run give @s shield[unbreakable={show_in_tooltip:false}]

# Combined
execute if score mode qq.config matches 2 run function qq:give/raycast_crossbow
execute if score mode qq.config matches 2 run give @s iron_sword[unbreakable={show_in_tooltip:false}]
execute if score mode qq.config matches 2 run item replace entity @s hotbar.8 with arrow
execute if score mode qq.config matches 2 run effect give @s speed infinite 1 true

# Ghost Trick
execute if score mode qq.config matches 3 run function qq:give/trident
execute if score mode qq.config matches 3 run effect give @s invisibility infinite 0 true
execute if score mode qq.config matches 3 run effect give @s weakness infinite 255 true

#execute if items entity @s hotbar.8 * run give @s arrow
#execute unless items entity @s hotbar.8 * run item replace entity @s hotbar.8 with arrow