# MODE
# down
execute store success score .click qq.config run data remove entity @n[type=interaction,tag=menu_mode_button,tag=DOWN] interaction
execute unless score .click qq.config matches 1 store success score .click qq.config run data remove entity @n[type=interaction,tag=menu_mode_button,tag=DOWN] attack
execute if score .click qq.config matches 1 run scoreboard players add mode qq.config 1
execute if score .click qq.config matches 1 if score mode qq.config matches 4.. run scoreboard players set mode qq.config 0
execute if score .click qq.config matches 1 run function qq:utility/menu/update_maps

# up
execute store success score .click qq.config run data remove entity @n[type=interaction,tag=menu_mode_button,tag=UP] interaction
execute unless score .click qq.config matches 1 store success score .click qq.config run data remove entity @n[type=interaction,tag=menu_mode_button,tag=UP] attack
execute if score .click qq.config matches 1 run scoreboard players remove mode qq.config 1
execute if score .click qq.config matches 1 if score mode qq.config matches ..-1 run scoreboard players set mode qq.config 3
execute if score .click qq.config matches 1 run function qq:utility/menu/update_maps

# PLAY
execute store success score .click qq.config run data remove entity @n[type=interaction,tag=menu_play_button] interaction
execute unless score .click qq.config matches 1 store success score .click qq.config run data remove entity @n[type=interaction,tag=menu_play_button] attack
execute if score .click qq.config matches 1 run function qq:states/pregame/start