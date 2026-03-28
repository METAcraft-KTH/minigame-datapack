# ============================================================
# race:util/checkpoint/create_elytra_station
# Called by: Admin (via function command)
# Executor:  Player at utility location
# ============================================================
# Place an elytra utility marker at current location.

summon minecraft:marker ~ ~ ~ {Tags:["race.utility","race.utility.elytra","race.marker"],data:{utility_type:"elytra"}}
tellraw @s {"text":"Elytra utility marker placed!","color":"light_purple"}
playsound minecraft:block.beacon.activate master @s ~ ~ ~ 1.0 1.0
