# This function is called when the game ends.
# It is meant to reset everything just before the next game initializes.

# Remove scoreboards
scoreboard players reset * hh.game
# Remove bossbar
bossbar remove hh:timer
# reset gamerules
function hh:exit_gamerule


## !!!EDIT BELOW!!! CHECKLIST OF THINGS TO RESET:

# spawnpoints
# inventories (+ ender chest if used)
# tags
# scoreboard values
team remove hh.players

## !!!EDIT BELOW!!! change to next game's id
scoreboard players set game.id GLOBAL 6

# TP everyone back to lobby
tp @a[tag=!admin] @n[tag=hh.tp.lobby]
execute as @a at @n[tag=hh.tp.lobby] run spawnpoint @s ~ ~ ~ ~