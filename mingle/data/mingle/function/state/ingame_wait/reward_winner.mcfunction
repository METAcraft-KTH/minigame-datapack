# ============================================================
# mingle:state/ingame_wait/reward_winner
# Called by: mingle:state/ingame_wait/enter
# Executor:  Winner player
#
# Awards base round points and streak bonus points.
# Streak bonus starts from the second consecutive win.
# ============================================================

# Base reward for each round win.
function score:add_points {points:50}

# Streak bonus (+10 per streak level after the first win).
execute if score @s mingle.stats.streak matches 2 run function score:add_points {points:10}
execute if score @s mingle.stats.streak matches 3 run function score:add_points {points:20}
execute if score @s mingle.stats.streak matches 4 run function score:add_points {points:30}
execute if score @s mingle.stats.streak matches 5 run function score:add_points {points:40}
execute if score @s mingle.stats.streak matches 6 run function score:add_points {points:50}
execute if score @s mingle.stats.streak matches 7 run function score:add_points {points:60}
execute if score @s mingle.stats.streak matches 8 run function score:add_points {points:70}
execute if score @s mingle.stats.streak matches 9 run function score:add_points {points:80}
execute if score @s mingle.stats.streak matches 10 run function score:add_points {points:90}
execute if score @s mingle.stats.streak matches 11 run function score:add_points {points:100}
execute if score @s mingle.stats.streak matches 12 run function score:add_points {points:110}
execute if score @s mingle.stats.streak matches 13 run function score:add_points {points:120}
execute if score @s mingle.stats.streak matches 14 run function score:add_points {points:130}
execute if score @s mingle.stats.streak matches 15.. run function score:add_points {points:140}
