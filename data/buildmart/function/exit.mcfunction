# This function is called when the game ends.
# It is meant to reset everything just before the next game initializes.

# Remove scoreboards
scoreboard players reset * buildmart.game
scoreboard players reset * buildmart.items_collected
# Remove bossbar
bossbar remove buildmart:timer
# reset gamerules
function buildmart:exit_gamerule


## !!!EDIT BELOW!!! CHECKLIST OF THINGS TO RESET:

# spawnpoints
# inventories (+ ender chest if used)
# tags
# scoreboard values

## !!!EDIT BELOW!!! change to next game's id
scoreboard players set game.id GLOBAL 5

# TP everyone back to lobby
tp @a[tag=!admin] @n[tag=buildmart.tp.lobby]
