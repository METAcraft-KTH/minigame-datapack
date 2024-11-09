# This function is called when the game ends.
# It is meant to reset everything just before the next game initializes.

# Remove scoreboards
scoreboard players reset * SURVIVALGAMES.game
# Remove bossbar
bossbar remove survivalgames:timer
# reset gamerules
function survivalgames:exit_gamerule


## !!!EDIT BELOW!!! CHECKLIST OF THINGS TO RESET:

# spawnpoints
# inventories (+ ender chest if used)
# tags
# scoreboard values

## !!!EDIT BELOW!!! change to next game's id
scoreboard players set game.id GLOBAL 7

scoreboard players set round SURVIVALGAMES.game 0

effect give @a[tag=!admin] minecraft:instant_health 1 50
effect give @a[tag=!admin] minecraft:saturation 1 255
effect clear @a[tag=!admin]
clear @a[tag=!admin]
experience set @a[tag=!admin] 0 levels
experience set @a[tag=!admin] 0 points
gamemode adventure @a[tag=!admin]

# TP everyone back to lobby
tp @a[tag=!admin] @n[tag=SURVIVALGAMES.tp.lobby]
spawnpoint @a[tag=!admin] ~ ~ ~ ~

set-block-break-rules remove
