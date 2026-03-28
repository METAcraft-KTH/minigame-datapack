# ============================================================
# race:util/checkpoint/create_remove_blocks_station
# Called by: Admin (via function command)
# Executor:  Player at utility location
# ============================================================
# Place a remove blocks utility marker at current location.

summon minecraft:marker ~ ~ ~ {Tags:["race.utility","race.utility.remove_blocks","race.marker"],data:{utility_type:"remove_blocks"}}
tellraw @s {"text":"Remove blocks utility marker placed!","color":"dark_gray"}
playsound minecraft:block.beacon.activate master @s ~ ~ ~ 1.0 0.5
