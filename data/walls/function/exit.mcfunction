# This function is called when the game ends.
# It is meant to reset everything just before the next game initializes.

# Remove scoreboards
scoreboard players reset * WALLS.game
# Remove bossbar
bossbar remove walls:timer
# reset gamerules
function walls:exit_gamerule


## !!!EDIT BELOW!!! CHECKLIST OF THINGS TO RESET:

# spawnpoints
# inventories (+ ender chest if used)
# tags
# scoreboard values

clear @a[tag=!admin]

## !!!EDIT BELOW!!! change to next game's id
scoreboard players set game.id GLOBAL 5

# TP everyone back to lobby
tp @a[tag=!admin] @n[tag=WALLS.tp.lobby]
execute as @a[tag=!admin] at @s run spawnpoint @s ~ ~ ~ ~



team remove WALLS.blue
team remove WALLS.red
team remove WALLS.green
team remove WALLS.yellow
