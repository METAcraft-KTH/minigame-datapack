# This function is called when the game ends.
# It is meant to reset everything just before the next game initializes.

# Remove scoreboards
scoreboard players reset * qq.game
# Remove bossbar
bossbar remove qq:timer
# reset gamerules
function qq:exit_gamerule


## !!!EDIT BELOW!!! CHECKLIST OF THINGS TO RESET:

# spawnpoints
# inventories (+ ender chest if used)
# tags
# scoreboard values
team remove qq.yellow
team remove qq.gold
team remove qq.red
team remove qq.players
tag @e remove hit

## !!!EDIT BELOW!!! change to next game's id
scoreboard objectives setdisplay sidebar
scoreboard players set game.id GLOBAL 6

# TP everyone back to lobby
tp @a[tag=!admin] @n[tag=qq.tp.lobby]

#Disable foreloading (run this last)
forceload remove all
