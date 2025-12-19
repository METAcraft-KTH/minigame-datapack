summon item ~ ~ ~ {Item:{id:"minecraft:stone", count:1},Tags:["set_item"],PickupDelay:0}
data modify entity @n[type=item,tag=set_item,distance=0] Owner set from entity @s UUID
data modify entity @n[type=item,tag=set_item,distance=0] Item set from entity @s Inventory[{Slot:-106b}]
item replace entity @s weapon.offhand with air
