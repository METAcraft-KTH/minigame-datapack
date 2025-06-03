# This function is called when the game ends.
# It is meant to reset everything just before the next game initializes.

# Remove scoreboards
scoreboard players reset * spleef.game
# Remove bossbar
bossbar remove spleef:timer
# reset gamerules
function spleef:exit_gamerule


## !!!EDIT BELOW!!! CHECKLIST OF THINGS TO RESET:

# spawnpoints
# inventories (+ ender chest if used)
# tags
# scoreboard values

## !!!EDIT BELOW!!! change to next game's id
scoreboard players set game.id GLOBAL 6

# TP everyone back to lobby
tp @a[tag=!admin] @n[tag=spleef.tp.lobby]