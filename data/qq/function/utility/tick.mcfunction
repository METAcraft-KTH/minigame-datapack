### this function runs every tick, as it is called by qq:tick with no conditions. do what you want with it.

# menu
function qq:utility/menu/tick

# projectile
function qq:utility/projectile/tick

# reload crossbow
execute as @a if predicate qq:reload_mainhand run item modify entity @s weapon.mainhand qq:charge
execute as @a if predicate qq:reload_offhand run item modify entity @s weapon.offhand qq:charge

# flyball
execute as @e[type=snowball,predicate=qq:is_flyball] at @s on origin run ride @s mount @n[type=snowball,predicate=qq:is_flyball]

# target
execute as @e[type=marker,tag=TargetBlock] at @s run function qq:utility/misc/target/target_tick

# misc
execute as @e[tag=EasterEggBoat] unless predicate qq:boat_has_rider run kill @s

