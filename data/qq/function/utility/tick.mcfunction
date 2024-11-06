### this function runs every tick, as it is called by hh:tick with no conditions. do what you want with it.

# menu
function hh:utility/menu/tick

# projectile
function hh:utility/projectile/tick

# reload crossbow
execute as @a if predicate hh:reload_mainhand run item modify entity @s weapon.mainhand hh:charge
execute as @a if predicate hh:reload_offhand run item modify entity @s weapon.offhand hh:charge

# flyball
execute as @e[type=snowball,predicate=hh:is_flyball] at @s on origin run ride @s mount @n[type=snowball,predicate=hh:is_flyball]

# target
execute as @e[type=marker,tag=TargetBlock] at @s run function hh:utility/misc/target/target_tick

# misc
execute as @e[tag=EasterEggBoat] unless predicate hh:boat_has_rider run kill @s

