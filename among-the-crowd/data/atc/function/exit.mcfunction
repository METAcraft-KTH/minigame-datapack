# This function is called when the game ends.
# It is meant to reset everything just before the next game initializes.

# Remove scoreboards
scoreboard players reset * atc.game
# Remove bossbar
bossbar remove atc:timer
# reset gamerules
function atc:exit_gamerule


## !!!EDIT BELOW!!! CHECKLIST OF THINGS TO RESET:

# spawnpoints
spawnpoint @a[tag=!admin] ~ ~ ~ ~ ~
# inventories (+ ender chest if used)
clear @a
# tags
tag @a remove atc.initial_seeker
tag @a remove atc.hider_death
# scoreboard values
team leave @a[tag=!admin]

stopwatch remove atc:pointticker

## !!!EDIT BELOW!!! change to next game's id
scoreboard players set game.id GLOBAL 3

# TP everyone back to lobby
tp @a[tag=!admin] @n[tag=atc.tp.lobby]

#Disable foreloading (run this last)
forceload remove all
