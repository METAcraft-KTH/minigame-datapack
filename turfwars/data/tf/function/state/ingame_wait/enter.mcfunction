# ============================================================
# tf:state/ingame_wait/enter
# Called by: tf:state/ingame_run/tick
# Executor:  Server
#
# Resolves round winners and losers, then starts wait phase.
# ============================================================

scoreboard players set ?phase tf.state 1
scoreboard players set ?phase_timer tf.timer 0
# increment round count
scoreboard players add ?round tf.state 1

# give items
give @a[team=tf.red] red_wool[can_place_on={blocks:["red_wool","red_terracotta"]}] 60
give @a[team=tf.blue] blue_wool[can_place_on={blocks:["blue_wool","blue_terracotta"]}] 60

# change round duration
execute if score ?round tf.state matches 1 run scoreboard players set time.ingame_wait tf.temp 600
execute if score ?round tf.state matches 2 run scoreboard players set time.ingame_wait tf.temp 400
execute if score ?round tf.state matches 3.. run scoreboard players set time.ingame_wait tf.temp 200

gamerule pvp false