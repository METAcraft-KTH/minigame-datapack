function walls:states/pregame/configure_gamerule
gamemode survival @a[tag=!admin]
clear @a[tag=!admin]
function walls:states/ingame/split_teams
execute as @a[tag=!admin] run function walls:states/ingame/set_ingame_tags
execute as @a[tag=!admin] run function walls:states/ingame/tp_to_spawn
execute as @a[tag=!admin] run function walls:states/ingame/give_items
