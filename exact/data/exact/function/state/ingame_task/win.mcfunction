# ============================================================
# exact:state/ingame_task/win
# Executor: player who completed the active task
# Guards: only valid during task phase
# ============================================================

execute unless score ?phase exact.state matches 1 run return 0
execute if entity @s[gamemode=spectator] run return 0
execute if entity @s[tag=exact.win] run return 0

# Mark this player as successful for the current round
# Keep inventory/item state as-is for task continuity.
tag @s add exact.win
clear @s

# Show winner feedback
title @s times 0 60 20
title @s title {"text":"COMPLETE","color":"green","bold":true}

# Rank-based broadcast and points
execute store result score #playersdone exact.state if entity @a[tag=!admin,tag=exact.win]

execute if score ?round exact.state matches 1 run function exact:state/ingame_task/win_tellraw {verb:"has played these games before!"}
execute if score ?round exact.state matches 2 run function exact:state/ingame_task/win_tellraw {verb:"regained their medical license!"}
execute if score ?round exact.state matches 3 run function exact:state/ingame_task/win_tellraw {verb:"understood the reference!"}
execute if score ?round exact.state matches 4 run function exact:state/ingame_task/win_tellraw {verb:"took lessons from Be$o$!"}
execute if score ?round exact.state matches 5 run function exact:state/ingame_task/win_tellraw {verb:"should see a doctor!"}
execute if score ?round exact.state matches 6 run function exact:state/ingame_task/win_tellraw {verb:"has avenged Jack Black!"}
execute if score ?round exact.state matches 7 run function exact:state/ingame_task/win_round7_random
execute if score ?round exact.state matches 8 run function exact:state/ingame_task/win_tellraw {verb:"can count better than Valve!"}
execute if score ?round exact.state matches 9 run function exact:state/ingame_task/win_tellraw {verb:"is a Minecraft YouTuber!"}
execute if score ?round exact.state matches 10 run function exact:state/ingame_task/win_tellraw {verb:"acted in self defense!"}
execute if score ?round exact.state matches 11 run function exact:state/ingame_task/win_tellraw {verb:"can touch grass, apparently!"}
execute if score ?round exact.state matches 12 run function exact:state/ingame_task/win_tellraw {verb:"shovels well!"}
execute if score ?round exact.state matches 13 run function exact:state/ingame_task/win_tellraw {verb:"doesn't need a recipe book!"}
execute if score ?round exact.state matches 14 run function exact:state/ingame_task/win_tellraw {verb:"should be locked up!"}
execute if score ?round exact.state matches 15 run function exact:state/ingame_task/win_tellraw {verb:"paid respects to Rick May!"}
execute if score ?round exact.state matches 16 run function exact:state/ingame_task/win_tellraw {verb:"cranked their hog!"}

# check how many players have not finished yet, and give points based on that
execute store result storage exact.temp points int 2 if entity @a[tag=!admin,tag=!exact.win]
function score:add_points with storage exact.temp

# check top 20 spots
execute if score #playersdone exact.state matches 1 run function score:add_points {points:100}
execute if score #playersdone exact.state matches 2 run function score:add_points {points:85}
execute if score #playersdone exact.state matches 3 run function score:add_points {points:70}
execute if score #playersdone exact.state matches 4 run function score:add_points {points:60}
execute if score #playersdone exact.state matches 5 run function score:add_points {points:50}
execute if score #playersdone exact.state matches 6 run function score:add_points {points:40}
execute if score #playersdone exact.state matches 7 run function score:add_points {points:30}
execute if score #playersdone exact.state matches 8 run function score:add_points {points:25}
execute if score #playersdone exact.state matches 9 run function score:add_points {points:20}
execute if score #playersdone exact.state matches 10 run function score:add_points {points:15}
execute if score #playersdone exact.state matches 11 run function score:add_points {points:15}
execute if score #playersdone exact.state matches 12 run function score:add_points {points:15}
execute if score #playersdone exact.state matches 13 run function score:add_points {points:15}
execute if score #playersdone exact.state matches 14 run function score:add_points {points:15}
execute if score #playersdone exact.state matches 15 run function score:add_points {points:15}
execute if score #playersdone exact.state matches 16 run function score:add_points {points:10}
execute if score #playersdone exact.state matches 17 run function score:add_points {points:10}
execute if score #playersdone exact.state matches 18 run function score:add_points {points:10}
execute if score #playersdone exact.state matches 19 run function score:add_points {points:10}
execute if score #playersdone exact.state matches 20 run function score:add_points {points:10}
