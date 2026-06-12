# ============================================================
# tf:state/pregame/enter
# Called by: tf:on/gamestart
# Executor:  Server
#
# Starts the 20-second pregame countdown.
# ============================================================

scoreboard players set ?phase tf.state 0
scoreboard players set ?phase_timer tf.timer 0
scoreboard players set ?round tf.state 0

kill @e[type=marker,tag=tf.border]
summon marker 31000 64 59969 {Tags:["tf.border"]}

team leave @a[tag=!admin]
function tf:state/pregame/scramble
tellraw @a {text:"Teams have been scrambled.",color:"gray"}

tp @s[team=tf.red] 31075 72 59995 90 0
tp @s[team=tf.blue] 30924 72 59995 -90 0


clear @s
give @s netherite_sword[unbreakable={}]
give @s bow[enchantments={infinity:1},unbreakable={}]
give @s arrow 1
give @s[team=tf.red] shears[enchantments={efficiency:5},can_break={blocks:["red_wool"]}]
give @s[team=tf.blue] shears[enchantments={efficiency:5},can_place_on={blocks:["blue_wool"]}]
item replace entity @s[team=tf.red] armor.head with red_wool[enchantments={binding_curse:1}]
item replace entity @s[team=tf.blue] armor.head with blue_wool[enchantments={binding_curse:1}]

title @a title {"text":"TURF WARS","color":"gold","bold":true}
title @a subtitle {"text":"Begin fighting in 15 seconds","color":"yellow"}
