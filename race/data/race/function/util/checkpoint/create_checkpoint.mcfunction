# ============================================================
# race:util/checkpoint/create_checkpoint
# Called by: Admin (via function command)
# Executor:  Player at checkpoint location
# ============================================================
# Place a checkpoint marker at current location.

# Summon marker with checkpoint tag
# Incrementing checkpoint counter stored in race.state
scoreboard players add #checkpoint_count race.state 1
execute store result score #cp_num race.state run scoreboard players get #checkpoint_count race.state
summon minecraft:marker ~ ~ ~ {Tags:["race.checkpoint","race.marker"],data:{checkpoint_id:0}}
execute as @e[type=minecraft:marker,tag=race.checkpoint,sort=nearest,limit=1] run data modify entity @s data.checkpoint_id set from score #cp_num race.state

tellraw @s [{"text":"Checkpoint #","color":"aqua"},{"score":{"name":"#cp_num","objective":"race.state"},"color":"gold"},{"text":" placed at your location","color":"aqua"}]
