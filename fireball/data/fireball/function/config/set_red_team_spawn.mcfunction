# call at the position where spawn should be

summon marker ~ ~ ~ {Tags:["this"]}
data modify storage fireball:config red_spawn_x set from entity @n[tag=this,distance=..10,type=marker] Pos[0]
execute store result storage fireball:config red_spawn_y int 1 run data get entity @n[tag=this,distance=..10,type=marker] Pos[1]
data modify storage fireball:config red_spawn_z set from entity @n[tag=this,distance=..10,type=marker] Pos[2]

kill @n[tag=this,distance=..10,type=marker]