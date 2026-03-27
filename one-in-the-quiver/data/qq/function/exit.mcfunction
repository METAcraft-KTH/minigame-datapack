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
tag @a remove qq.dead

# Clear scoreboard display managed by this minigame
scoreboard objectives setdisplay sidebar

#Run exit callback
function #qq:exit
