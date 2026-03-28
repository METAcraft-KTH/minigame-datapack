# ============================================================
# race:util/checkpoint/create_trident_station
# Called by: Admin (via function command)
# Executor:  Player at utility location
# ============================================================
# Place a trident utility marker at current location.

summon minecraft:marker ~ ~ ~ {Tags:["race.utility","race.utility.trident","race.marker"],data:{utility_type:"trident"}}
tellraw @s {"text":"Trident utility marker placed!","color":"dark_aqua"}
playsound minecraft:block.beacon.activate master @s ~ ~ ~ 1.0 1.0
