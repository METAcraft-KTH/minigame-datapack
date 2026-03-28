# ============================================================
# race:util/checkpoint/create_remove_trident_station
# Called by: Admin (via function command)
# Executor:  Player at utility location
# ============================================================
# Place a remove trident utility marker at current location.

summon minecraft:marker ~ ~ ~ {Tags:["race.utility","race.utility.remove_trident","race.marker"],data:{utility_type:"remove_trident"}}
tellraw @s {"text":"Remove trident utility marker placed!","color":"dark_red"}
playsound minecraft:block.beacon.activate master @s ~ ~ ~ 1.0 0.5
