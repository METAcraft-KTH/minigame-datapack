# disable all arenas
tag @e[tag=qq.active_arena] remove qq.active_arena

# set arena by mode
execute if score mode qq.config matches 0 run scoreboard players set arena qq.config 1
execute if score mode qq.config matches 1 run scoreboard players set arena qq.config 3 
execute if score mode qq.config matches 2 run scoreboard players set arena qq.config 2
execute if score mode qq.config matches 3 run scoreboard players set arena qq.config 3

# enable one arena
execute if score arena qq.config matches 1 run tag @e[tag=qq.arena1] add qq.active_arena
execute if score arena qq.config matches 2 run tag @e[tag=qq.arena2] add qq.active_arena
execute if score arena qq.config matches 3 run tag @e[tag=qq.arena3] add qq.active_arena