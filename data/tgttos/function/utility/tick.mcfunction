# this function runs every tick, as it is called by tgttos:tick with no conditions. do what you want with it.

execute positioned 50032 10 32 as @e[type=item,distance=..100] run data merge entity @s {PickupDelay:0s}

execute at @n[tag=tgttos.tp.arena] as @e[type=ender_pearl,distance=..2000] at @s run function tgttos:utility/as_pearl

execute as @a[tag=!admin] if items entity @s weapon.mainhand #wool run item modify entity @s weapon.mainhand tgttos:infinite_blocks
execute as @a[tag=!admin] if items entity @s weapon.offhand #wool run item modify entity @s weapon.offhand tgttos:infinite_blocks

execute as @a[tag=!admin] if items entity @s weapon.mainhand ender_pearl run item modify entity @s weapon.mainhand tgttos:infinite_pearls
execute as @a[tag=!admin] if items entity @s weapon.offhand ender_pearl run item modify entity @s weapon.offhand tgttos:infinite_pearls

execute as @a[tag=!admin] if items entity @s weapon.mainhand horse_spawn_egg run item modify entity @s weapon.mainhand tgttos:can_place_anywhere
execute as @a[tag=!admin] if items entity @s weapon.offhand horse_spawn_egg run item modify entity @s weapon.offhand tgttos:can_place_anywhere

effect give @a[tag=!admin] night_vision infinite 0 true
effect give @a[tag=!admin] resistance infinite 4 true

execute as @e[type=horse] if block ~ ~ ~ nether_portal run tp @s ~ ~-50 ~