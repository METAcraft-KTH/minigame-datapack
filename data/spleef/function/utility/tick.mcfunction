# this function runs every tick, as it is called by spleef:tick with no conditions. do what you want with it.

execute positioned 50032 10 32 as @e[type=experience_bottle,distance=..100] at @s run function spleef:utility/as_xp_bottle

execute positioned 50032 10 32 as @e[type=tnt,distance=..100] at @s run function spleef:utility/as_tnt