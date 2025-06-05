# this function runs every tick, as it is called by spleef:tick with no conditions. do what you want with it.

execute positioned 50032 10 32 as @e[type=experience_bottle,distance=..100] at @s run function spleef:utility/as_xp_bottle

execute positioned 50032 10 32 as @e[type=tnt,distance=..100] at @s run function spleef:utility/as_tnt

execute positioned 50032 10 32 as @e[type=item,distance=..100] run data merge entity @s {PickupDelay:0s}

execute as @a[tag=!admin] at @s store result score @s spleef.Y run data get entity @s Pos[1] 1

execute as @a[tag=!admin] if items entity @s weapon.mainhand wind_charge run item modify entity @s weapon.mainhand spleef:infinite_wind_charges
execute as @a[tag=!admin] if items entity @s weapon.offhand wind_charge run item modify entity @s weapon.offhand spleef:infinite_wind_charges

effect give @a[tag=!admin] night_vision infinite 0 true
effect give @a[tag=!admin] resistance infinite 4 true