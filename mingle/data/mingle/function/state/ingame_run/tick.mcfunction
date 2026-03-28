# ============================================================
# mingle:state/ingame_run/tick
# Called by: mingle:_tick
# Executor:  Server
#
# 30-second mingle phase with live control-point validation.
# ============================================================

scoreboard players add ?phase_timer mingle.timer 1

function mingle:state/ingame_run/evaluate_control_points

# countdown math
scoreboard players operation #remaining mingle.temp = time.ingame_run mingle.temp
scoreboard players operation #remaining mingle.temp -= ?phase_timer mingle.timer
scoreboard players operation #display mingle.temp = #remaining mingle.temp
scoreboard players add #display mingle.temp 19
scoreboard players operation #display mingle.temp /= #20 main.const
execute if score #display mingle.temp matches ..0 run scoreboard players set #display mingle.temp 0

title @a times 0 25 0
title @a title [{"score":{"name":"#display","objective":"mingle.temp"},bold:true}]
# admin see only target group size
execute as @a[tag=admin] run title @s subtitle ["Target group size: ",{"score":{"name":"?target_group","objective":"mingle.state"}}]

# refill blocks
execute as @a[tag=!admin] at @s run item modify entity @s weapon.offhand mingle:refill

# players see group size and whether they're in a cp
# not in cp
execute as @a[tag=!admin,gamemode=!spectator,tag=!mingle.in_cp] run title @s subtitle [{"text":"Not on point | Form group of ","color":"gray"},{"score":{"name":"?target_group","objective":"mingle.state"}}]
effect clear @a[tag=!admin,gamemode=!spectator,tag=!mingle.in_cp] glowing
# in cp, missing players
execute as @a[tag=!admin,gamemode=!spectator,tag=mingle.in_cp,tag=mingle.player.toofew] run title @s subtitle ["",{"text":"Need more players | ","color":"yellow"},{"score":{"name":"@s","objective":"mingle.hud"},color:"white"},"/",{"score":{"name":"?target_group","objective":"mingle.state"}}]
# in cp, exact right number
execute as @a[tag=!admin,gamemode=!spectator,tag=mingle.in_cp,tag=mingle.player.correct] run title @s subtitle ["",{"text":"Correct group size | ","color":"green"},{"score":{"name":"@s","objective":"mingle.hud"},color:"white"},"/",{"score":{"name":"?target_group","objective":"mingle.state"}}]
# in cp, exact right number
execute as @a[tag=!admin,gamemode=!spectator,tag=mingle.in_cp,tag=mingle.player.toomany] run title @s subtitle ["",{"text":"Too many players | ","color":"red"},{"score":{"name":"@s","objective":"mingle.hud"},color:"white"},"/",{"score":{"name":"?target_group","objective":"mingle.state"}}]
# show glowing
effect give @a[tag=!admin,gamemode=!spectator,tag=!mingle.in_cp] glowing 2 0 true

# cp show radius and delete blocks
execute as @e[type=minecraft:block_display,tag=mingle.cp] at @s run function mingle:state/ingame_run/cp_particles

# see win streak
execute as @a[tag=!admin] run title @s actionbar ["Round ",{"score":{"name":"?round","objective":"mingle.state"},color:"light_purple"}," | Form groups of ",{"score":{"name":"?target_group","objective":"mingle.state"},color:"aqua"}," | Current mingle streak: ",{score:{name:"@s",objective:"mingle.streak"},color:"gold"}]

execute if score ?phase_timer mingle.timer >= time.ingame_run mingle.temp run function mingle:state/ingame_wait/enter
