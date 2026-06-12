# ============================================================
# tf:state/ingame_wait/enter
# Called by: tf:state/ingame_run/tick
# Executor:  Server
#
# Resolves round winners and losers, then starts wait phase.
# ============================================================

scoreboard players set ?phase tf.state 2
scoreboard players set ?phase_timer tf.timer 0

# remove blocks and shears
clear @a[tag=!admin]

#tag @e[type=block_display,tag=tf.cp] add tf.cp.disabled

scoreboard players add @a[tag=tf.player.correct] tf.stats.wins 1
scoreboard players add @a[tag=tf.player.correct] tf.streak 1
execute as @a[tag=tf.player.correct] run scoreboard players operation @s tf.stats.streak > @s tf.streak
scoreboard players set @a[tag=!tf.player.correct] tf.streak 0

execute as @a[tag=tf.player.correct] run function tf:state/ingame_wait/reward_winner

title @a times 0 40 20
title @a title ""
execute as @a[tag=!admin,tag=tf.player.correct] run title @s title {"text":"MINGLED","color":"green"}
execute as @a[tag=!admin,tag=tf.player.correct] run tellraw @s [{"text":"✔ Round ","color":"green","bold":true},{score:{name:"?round",objective:"tf.state"}}," won"]
execute as @a[tag=!admin,tag=!tf.player.correct] run title @s title {"text":"OUTCASTED","color":"red"}
execute as @a[tag=!admin,tag=!tf.player.correct] run tellraw @s [{"text":"✘ Round ","color":"red","bold":true},{score:{name:"?round",objective:"tf.state"}}," lost"]
execute as @a[tag=admin] run tellraw @s [{"text":"✔ Round ","color":"white","bold":true},{score:{name:"?round",objective:"tf.state"}}," results:"]

# get number of players
execute store result score ?winners tf.temp if entity @a[tag=!admin,tag=tf.player.correct]
execute store result score ?losers tf.temp if entity @a[tag=!admin,tag=!tf.player.correct]
execute store result score ?flavor tf.temp run random value 0..9
execute if score ?flavor tf.temp matches 0 run tellraw @a [{text:"",color:"gray"},{score:{name:"?winners",objective:"tf.temp"},color:"green"}," tfd successfully, ",{score:{name:"?losers",objective:"tf.temp"},color:"red"}," did not."]
execute if score ?flavor tf.temp matches 1 run tellraw @a [{text:"",color:"gray"},{score:{name:"?winners",objective:"tf.temp"},color:"green"}," added each other on LinkedIn, ",{score:{name:"?losers",objective:"tf.temp"},color:"red"}," did not."]
execute if score ?flavor tf.temp matches 2 run tellraw @a [{text:"",color:"gray"},{score:{name:"?winners",objective:"tf.temp"},color:"green"}," have played these games before, ",{score:{name:"?losers",objective:"tf.temp"},color:"red"}," have not."]
execute if score ?flavor tf.temp matches 3 run tellraw @a [{text:"",color:"gray"},{score:{name:"?winners",objective:"tf.temp"},color:"green"}," are extroverts, ",{score:{name:"?losers",objective:"tf.temp"},color:"red"}," are not."]
execute if score ?flavor tf.temp matches 4 run tellraw @a [{text:"",color:"gray"},{score:{name:"?winners",objective:"tf.temp"},color:"green"}," really really enjoyed socializing, ",{score:{name:"?losers",objective:"tf.temp"},color:"red"}," did not."]
execute if score ?flavor tf.temp matches 5 run tellraw @a [{text:"",color:"gray"},{score:{name:"?winners",objective:"tf.temp"},color:"green"}," are great at group projects, ",{score:{name:"?losers",objective:"tf.temp"},color:"red"}," are not."]
execute if score ?flavor tf.temp matches 6 run tellraw @a [{text:"",color:"gray"},{score:{name:"?winners",objective:"tf.temp"},color:"green"}," understood the corporate game, ",{score:{name:"?losers",objective:"tf.temp"},color:"red"}," did not."]
execute if score ?flavor tf.temp matches 7 run tellraw @a [{text:"",color:"gray"},{score:{name:"?winners",objective:"tf.temp"},color:"green"}," are goated with the sauce, ",{score:{name:"?losers",objective:"tf.temp"},color:"red"}," are not."]
execute if score ?flavor tf.temp matches 8 run tellraw @a [{text:"",color:"gray"},{score:{name:"?winners",objective:"tf.temp"},color:"green"}," are having dinner together after this, ",{score:{name:"?losers",objective:"tf.temp"},color:"red"}," are not."]
execute if score ?flavor tf.temp matches 9 run tellraw @a [{text:"",color:"gray"},{score:{name:"?winners",objective:"tf.temp"},color:"green"}," just made a hustle post on LinkedIn, ",{score:{name:"?losers",objective:"tf.temp"},color:"red"}," did not."]

execute as @a[scores={tf.streak=3}] run tellraw @a ["",{text:"⭐ ",color:"gold"},{selector:"@s",color:"green"}," has tfd 3 rounds in a row!"]
execute as @a[scores={tf.streak=6}] run tellraw @a ["",{text:"⭐⭐ ",color:"gold"},{selector:"@s",color:"green"}," has tfd 6 rounds in a row!!"]
execute as @a[scores={tf.streak=9}] run tellraw @a ["",{text:"⭐⭐⭐ ",color:"gold"},{selector:"@s",color:"green"}," has tfd 9 rounds in a row!!!"]
execute as @a[scores={tf.streak=12}] run tellraw @a ["",{text:"⭐⭐⭐⭐ ",color:"gold"},{selector:"@s",color:"green"}," has tfd 12 rounds in a row!!!!"]

#title @a title {"text":"Round Locked","color":"aqua","bold":true}
#title @a subtitle [{"text":"Target was ","color":"yellow"},{"score":{"name":"?target_group","objective":"tf.state"}}]
