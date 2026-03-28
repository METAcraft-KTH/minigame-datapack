# ============================================================
# race:util/checkpoint/create_remove_elytra_station
# Called by: Admin (via function command)
# Executor:  Player at utility location
# ============================================================
# Place a remove elytra utility marker at current location.

summon minecraft:marker ~ ~ ~ {Tags:["race.utility","race.utility.remove_elytra","race.marker"],data:{utility_type:"remove_elytra"}}
tellraw @s {"text":"Remove elytra utility marker placed!","color":"red"}
playsound minecraft:block.beacon.activate master @s ~ ~ ~ 1.0 0.5
