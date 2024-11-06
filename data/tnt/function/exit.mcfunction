# This function is called when the game ends.
# It is meant to reset everything just before the next game initializes.

# Remove scoreboards
scoreboard players reset * tnt.game
# Remove bossbar
bossbar remove tnt:timer
# reset gamerules
function tnt:exit_gamerule


## !!!EDIT BELOW!!! CHECKLIST OF THINGS TO RESET:

# spawnpoints
# inventories (+ ender chest if used)
# tags
# scoreboard values

## !!!EDIT BELOW!!! change to next game's id
scoreboard players set game.id GLOBAL 2

# TP everyone back to lobby
tp @a @n[tag=tnt.tp.lobby]