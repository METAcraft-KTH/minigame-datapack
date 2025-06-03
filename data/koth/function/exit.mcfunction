# This function is called when the game ends.
# It is meant to reset everything just before the next game initializes.

# Remove scoreboards
scoreboard players reset * koth.game
# Remove bossbar
bossbar remove koth:timer
# reset gamerules
function koth:exit_gamerule


## !!!EDIT BELOW!!! CHECKLIST OF THINGS TO RESET:

# spawnpoints
# inventories (+ ender chest if used)
# tags
# scoreboard values

## !!!EDIT BELOW!!! change to next game's id
scoreboard players set game.id GLOBAL 7

# TP everyone back to lobby
tp @a[tag=!admin] @n[tag=koth.tp.lobby]