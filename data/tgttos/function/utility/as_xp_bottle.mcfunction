summon tnt ~ ~ ~ {Tags:["tgttos.tnt.new"],fuse:60,CustomName:"3",CustomNameVisible:true,explosion_power:3.0f}
data modify entity @n[type=tnt,tag=tgttos.tnt.new,distance=..1] Motion set from entity @s Motion
kill @s
tag @n[type=tnt,tag=tgttos.tnt.new,distance=..1] remove tgttos.tnt.new