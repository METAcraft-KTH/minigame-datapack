# ============================================================
# race:util/checkpoint/create_blocks_station
# Called by: Admin (via function command)
# Executor:  Player at utility location
# ============================================================
# Place a blocks utility marker at current location.

summon minecraft:marker ~ ~ ~ {Tags:["race.utility","race.utility.blocks","race.marker"],data:{utility_type:"blocks"}}
tellraw @s {"text":"Blocks utility marker placed!","color":"dark_red"}
playsound minecraft:block.beacon.activate master @s ~ ~ ~ 1.0 1.0
