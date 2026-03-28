clear @s
execute store result score ? mingle.temp run random value 0..11
execute if score ? mingle.temp matches 0 run item replace entity @s weapon.offhand with brown_wool[can_place_on={}]
execute if score ? mingle.temp matches 1 run item replace entity @s weapon.offhand with orange_wool[can_place_on={}]
execute if score ? mingle.temp matches 2 run item replace entity @s weapon.offhand with magenta_wool[can_place_on={}]
execute if score ? mingle.temp matches 3 run item replace entity @s weapon.offhand with light_blue_wool[can_place_on={}]
execute if score ? mingle.temp matches 4 run item replace entity @s weapon.offhand with yellow_wool[can_place_on={}]
execute if score ? mingle.temp matches 5 run item replace entity @s weapon.offhand with lime_wool[can_place_on={}]
execute if score ? mingle.temp matches 6 run item replace entity @s weapon.offhand with pink_wool[can_place_on={}]
execute if score ? mingle.temp matches 7 run item replace entity @s weapon.offhand with red_wool[can_place_on={}]
execute if score ? mingle.temp matches 8 run item replace entity @s weapon.offhand with blue_wool[can_place_on={}]
execute if score ? mingle.temp matches 9 run item replace entity @s weapon.offhand with cyan_wool[can_place_on={}]
execute if score ? mingle.temp matches 10 run item replace entity @s weapon.offhand with purple_wool[can_place_on={}]
execute if score ? mingle.temp matches 11 run item replace entity @s weapon.offhand with green_wool[can_place_on={}]

item replace entity @s weapon.mainhand with shears[can_break={},unbreakable={},enchantments={efficiency:3}]