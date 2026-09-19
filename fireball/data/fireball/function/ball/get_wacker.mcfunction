# ran on the wacking player
tag @s add this_wacker
#say wacked the fireball

# change target
function fireball:ball/change_target

execute as @n[distance=..10,tag=this_fireball,type=item_display] run function fireball:ball/on_wacked

tag @s remove this_wacker