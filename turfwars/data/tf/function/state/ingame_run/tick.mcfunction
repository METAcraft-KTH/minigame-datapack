# ============================================================
# tf:state/ingame_run/tick
# Called by: tf:_tick
# Executor:  Server
#
# 30-second tf phase with live control-point validation.
# ============================================================

scoreboard players add ?phase_timer tf.timer 1

function tf:state/ingame_run/evaluate_control_points

# countdown math
scoreboard players operation #remaining tf.temp = time.ingame_run tf.temp
scoreboard players operation #remaining tf.temp -= ?phase_timer tf.timer
scoreboard players operation #display tf.temp = #remaining tf.temp
scoreboard players add #display tf.temp 19
scoreboard players operation #display tf.temp /= #20 main.const
execute if score #display tf.temp matches ..0 run scoreboard players set #display tf.temp 0

title @a times 0 25 0
title @a title [{"score":{"name":"#display","objective":"tf.temp"},bold:true}]
# admin see only target group size
execute as @a[tag=admin] run title @s subtitle ["Target group size: ",{"score":{"name":"?target_group","objective":"tf.state"}}]

# refill blocks
execute as @a[tag=!admin] at @s run item modify entity @s weapon.offhand tf:refill

# players see group size and whether they're in a cp
# not in cp
execute as @a[tag=!admin,gamemode=!spectator,tag=!tf.in_cp] run title @s subtitle [{"text":"Not on point | Form group of ","color":"gray"},{"score":{"name":"?target_group","objective":"tf.state"}}]
effect clear @a[tag=!admin,gamemode=!spectator,tag=!tf.in_cp] glowing
# in cp, missing players
execute as @a[tag=!admin,gamemode=!spectator,tag=tf.in_cp,tag=tf.player.toofew] run title @s subtitle ["",{"text":"Need more players | ","color":"yellow"},{"score":{"name":"@s","objective":"tf.hud"},color:"white"},"/",{"score":{"name":"?target_group","objective":"tf.state"}}]
# in cp, exact right number
execute as @a[tag=!admin,gamemode=!spectator,tag=tf.in_cp,tag=tf.player.correct] run title @s subtitle ["",{"text":"Correct group size | ","color":"green"},{"score":{"name":"@s","objective":"tf.hud"},color:"white"},"/",{"score":{"name":"?target_group","objective":"tf.state"}}]
# in cp, exact right number
execute as @a[tag=!admin,gamemode=!spectator,tag=tf.in_cp,tag=tf.player.toomany] run title @s subtitle ["",{"text":"Too many players | ","color":"red"},{"score":{"name":"@s","objective":"tf.hud"},color:"white"},"/",{"score":{"name":"?target_group","objective":"tf.state"}}]
# show glowing
effect give @a[tag=!admin,gamemode=!spectator,tag=!tf.in_cp] glowing 2 0 true

# cp show radius and delete blocks
execute as @e[type=minecraft:block_display,tag=tf.cp] at @s run function tf:state/ingame_run/cp_particles

# see win streak
execute as @a[tag=!admin] run title @s actionbar ["Round ",{"score":{"name":"?round","objective":"tf.state"},color:"light_purple"}," | Form groups of ",{"score":{"name":"?target_group","objective":"tf.state"},color:"aqua"}," | Current tf streak: ",{score:{name:"@s",objective:"tf.streak"},color:"gold"}]

execute if score ?phase_timer tf.timer >= time.ingame_run tf.temp run function tf:state/ingame_wait/enter
