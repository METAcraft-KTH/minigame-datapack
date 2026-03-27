# ============================================================
# spleef:on/player/death
# Called by: main:private/call/death
# Executor:  Player who died
# Preconditions: superstate == 3
# ============================================================

# Only award/elimination logic during active rounds.
execute unless score ?state spleef.game matches 21..23 run return 0

# gib points
gamemode spectator
execute as @a[tag=!admin,gamemode=adventure] run function score:add_points {points:4}

tellraw @s {"text":"☠ Slipped on a banan","color":"red","bold":true}

#execute store result score #allplayers spleef.game if entity @a[tag=!admin]
execute store result score #playersleft spleef.game if entity @a[tag=!admin,gamemode=adventure]
execute store result score #playersleft_plus1 spleef.game if entity @a[tag=!admin,gamemode=adventure]
scoreboard players add #playersleft_plus1 spleef.game 1
tellraw @a ["",{selector:"@s",color:"red"}," just died. ", {score:{name:"#playersleft",objective:"spleef.game"},color:"gold"}," players remain."]
#tellraw @s [{"text":"You ranked ","color":"gray"},{score:{name:"#playersleft_plus1",objective:"spleef.game"}},"/",{score:{name:"#allplayers",objective:"spleef.game"}}," this round"]
execute if score #playersleft_plus1 spleef.game matches 11.. run tellraw @s [{"text":"You came ","color":"gray"},{score:{name:"#playersleft_plus1",objective:"spleef.game"}},"th this round"]
execute if score #playersleft_plus1 spleef.game matches ..10 run tellraw @s [{"text":"You came ","color":"gray"},{score:{name:"#playersleft_plus1",objective:"spleef.game"}},"th this round (top 10 survivors: bonus points)"]

execute if score #playersleft_plus1 spleef.game matches 1 run function score:add_points {points:100}
execute if score #playersleft_plus1 spleef.game matches 2 run function score:add_points {points:85}
execute if score #playersleft_plus1 spleef.game matches 3 run function score:add_points {points:70}
execute if score #playersleft_plus1 spleef.game matches 4 run function score:add_points {points:55}
execute if score #playersleft_plus1 spleef.game matches 5 run function score:add_points {points:45}
execute if score #playersleft_plus1 spleef.game matches 6 run function score:add_points {points:35}
execute if score #playersleft_plus1 spleef.game matches 7 run function score:add_points {points:25}
execute if score #playersleft_plus1 spleef.game matches 8 run function score:add_points {points:20}
execute if score #playersleft_plus1 spleef.game matches 9 run function score:add_points {points:15}
execute if score #playersleft_plus1 spleef.game matches 10 run function score:add_points {points:10}