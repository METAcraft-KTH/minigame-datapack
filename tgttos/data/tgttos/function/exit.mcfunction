# This function is called when the game ends.
# It is meant to reset everything just before the next game initializes.

# Remove scoreboards
scoreboard players reset * tgttos.game
# Remove bossbar
bossbar remove tgttos:timer
# reset gamerules
function tgttos:exit_gamerule


## !!!EDIT BELOW!!! CHECKLIST OF THINGS TO RESET:

# spawnpoints
# inventories (+ ender chest if used)
# tags
# scoreboard values

## !!!EDIT BELOW!!! change to next game's id
scoreboard players set game.id GLOBAL 3

# TP everyone back to lobby
tp @a[tag=!admin] @n[tag=tgttos.tp.lobby]
execute as @a[tag=!admin] run gamemode adventure
effect clear @a[tag=!admin]