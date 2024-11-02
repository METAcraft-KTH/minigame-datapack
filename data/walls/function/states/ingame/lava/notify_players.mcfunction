#xDist
#zDist
#y

$execute if score @s WALLS.lava_timer matches 500 run tellraw @a[dx=$(xDist),dy=300,dz=$(zDist)] {"text":"You hear a loud trembling underground","color":"red"}
$execute if score @s WALLS.lava_timer matches 500 as @a[dx=$(xDist),dy=300,dz=$(zDist)] at @s run playsound minecraft:entity.ender_dragon.death ambient @s ~ ~ ~ 1 0.1

$execute if score @s WALLS.lava_timer matches 250 run tellraw @a[dx=$(xDist),dy=300,dz=$(zDist)] {"text":"It's getting unusually hot","color":"red"}

$execute if score @s WALLS.lava_timer matches 100 run tellraw @a[dx=$(xDist),dy=300,dz=$(zDist)] {"text":"Your instincts tell you lava is rising beneath you","color":"red"}

$execute if score @s WALLS.lava_timer matches 1 run title @a[dx=$(xDist),dy=300,dz=$(zDist)] title {"text":"The lava has breached bedrock!","color":"red"}
$execute if score @s WALLS.lava_timer matches 1 run title @a[dx=$(xDist),dy=300,dz=$(zDist)] subtitle {"text":"Abandon the mines, abandon the mines!","color":"red"}

$execute if score @s WALLS.lava_timer matches 0 run title @a[dx=$(xDist),dy=300,dz=$(zDist)] actionbar {"text":"Lava Y: $(y)","color":"red","bold":true}

