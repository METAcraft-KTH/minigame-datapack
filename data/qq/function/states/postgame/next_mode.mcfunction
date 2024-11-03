# kill any tridents and items on the ground
kill @e[type=trident]
kill @e[type=item]

# this was the last mode, exit
execute if score mode qq.config matches 3 run return run function qq:exit

# it was not the last mode, switch to next and restart
execute if score mode qq.config matches 2 run scoreboard players set mode qq.config 3
execute if score mode qq.config matches 0 run scoreboard players set mode qq.config 2
function qq:states/pregame/start