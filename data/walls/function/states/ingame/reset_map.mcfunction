# id
$execute at @n[tag=WALLS.r$(id)_reset] run kill @e[type=!player,type=!marker,type=!item_display,type=!block_display,type=!text_display,distance=..500]
$execute at @n[tag=WALLS.r$(id)_reset] run kill @e[type=!player,type=!marker,type=!item_display,type=!block_display,type=!text_display,distance=..500]
$execute at @e[tag=WALLS.r$(id)_reset] run function walls:states/ingame/on_reset {id: $(id)}
