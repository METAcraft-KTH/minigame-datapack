# This function is called when the game ends.
# It is meant to reset everything just before the next game initializes.

# Remove scoreboards
scoreboard players reset * exact.game
# Remove bossbar
bossbar remove exact:timer
# reset gamerules
function exact:exit_gamerule


## !!!EDIT BELOW!!! CHECKLIST OF THINGS TO RESET:

# spawnpoints
# inventories (+ ender chest if used)
# tags
# scoreboard values

## !!!EDIT BELOW!!! change to next game's id
scoreboard players set game.id GLOBAL 3

# TP everyone back to lobby
tp @a[tag=!admin] @n[tag=exact.tp.lobby]
execute as @a[tag=!admin] run gamemode adventure
effect clear @a[tag=!admin]

#Run exit callback
function #exact:exit
