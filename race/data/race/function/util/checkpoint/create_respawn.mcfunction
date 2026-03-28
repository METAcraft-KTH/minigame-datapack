# ============================================================
# race:util/checkpoint/create_respawn
# Called by: Admin (via function command)
# Executor:  Player at respawn location
# ============================================================
# Place a respawn marker at current location.

# Incrementing respawn counter
scoreboard players add #respawn_count race.state 1
execute store result score #respawn_num race.state run scoreboard players get #respawn_count race.state
summon minecraft:marker ~ ~ ~ {Tags:["race.respawn","race.marker"],data:{respawn_id:0}}
execute as @e[type=minecraft:marker,tag=race.respawn,sort=nearest,limit=1] run data modify entity @s data.respawn_id set from score #respawn_num race.state

tellraw @s [{"text":"Respawn point #","color":"yellow"},{"score":{"name":"#respawn_num","objective":"race.state"},"color":"gold"},{"text":" placed at your location","color":"yellow"}]
