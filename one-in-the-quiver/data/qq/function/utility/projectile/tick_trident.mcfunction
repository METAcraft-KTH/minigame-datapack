## if thrower dead
tag @s add thisTrident
execute on origin if score @s qq.time_alive matches 0 run tag @n[tag=thisTrident] add killWhenLand

## hit ground
execute if predicate qq:in_ground run kill @s[tag=killWhenLand]
execute if predicate qq:in_ground run data merge entity @s {Glowing:1b}
execute if predicate qq:in_ground unless data entity @s {inBlockState:{Name:"minecraft:target"}} run tag @s add missed
execute if predicate qq:in_ground if data entity @s {inBlockState:{Name:"minecraft:target"}} run data merge entity @s {DealtDamage:1b}

# make it start returning if too far away
execute at @s on origin if entity @s[distance=100..] run data merge entity @n[tag=thisTrident] {DealtDamage:1b, Glowing:1b}
execute at @s on origin if entity @s[distance=100..] run tag @n[tag=thisTrident] add missed

# return if no hit
tag @s remove thisTrident
execute unless predicate qq:dealt_damage run return 0
execute if entity @s[tag=missed] run return 0

## the following is only run for tridents that hit something
kill @s[tag=killWhenLand]

# playsound
execute if entity @s[tag=!did_hit] on origin at @s run playsound minecraft:entity.arrow.hit_player player @s ~ ~ ~ 100 1 1
tag @s add did_hit

execute on origin if entity @s[gamemode=!creative] if items entity @s weapon.mainhand * run return 1

# Return trident instantly if mainhand empty
tag @s add thisTrident
execute at @s on origin if entity @s[gamemode=!creative] run item replace entity @s weapon.mainhand from entity @n[type=trident,tag=thisTrident] hotbar.0
#execute if predicate qq:dealt_damage if entity @s[tag=!missed] on origin if entity @s[gamemode=!creative] run give @s trident[enchantments={levels:{loyalty:1},show_in_tooltip:true},unbreakable={show_in_tooltip:false}]
kill @s