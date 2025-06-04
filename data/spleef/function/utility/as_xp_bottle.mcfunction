summon tnt ~ ~ ~ {Tags:["spleef.tnt.new"],fuse:60,CustomName:"3",CustomNameVisible:true}
data modify entity @n[type=tnt,tag=spleef.tnt.new,distance=..1] Motion set from entity @s Motion
kill @s
tag @n[type=tnt,tag=spleef.tnt.new,distance=..1] remove spleef.tnt.new