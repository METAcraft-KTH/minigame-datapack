# This function is called when the game ends.
# It is meant to reset everything just before the next game initializes.

# Remove scoreboards
scoreboard players reset * ttag.game
# Remove bossbar
bossbar remove ttag:timer
# reset gamerules
function ttag:exit_gamerule


## !!!EDIT BELOW!!! CHECKLIST OF THINGS TO RESET:

# spawnpoints
# inventories (+ ender chest if used)
# tags
# scoreboard values
setworldspawn 0 64 0
spawnpoint @a[tag=!admin] 0 64 0

## !!!EDIT BELOW!!! change to next game's id
scoreboard players set game.id GLOBAL 2

# TP everyone back to lobby
tp @a[tag=!admin] @n[tag=ttag.tp.lobby]
clear @a[tag=!admin]
effect clear @a[tag=!admin]