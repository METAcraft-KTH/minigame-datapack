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

# Whoever got there first heals a heart back. Regeneration II ticks every
# 25 ticks, so 3 seconds is worth two half-hearts, and it cannot overshoot
# the 5-heart cap from exact:util/init_player. Finishing in the last 3
# seconds of a round is the one case where ingame_wait/enter's effect clear
# cuts the heal short -- the cutoff timer keeps that rare.
execute if score #playersdone exact.state matches 1 run effect give @s minecraft:regeneration 3 1 true
execute if score #playersdone exact.state matches 1 run title @s subtitle {"text":"First! +1 heart","color":"green"}

execute if score ?task exact.state matches 1 run function exact:state/ingame_task/win_tellraw {verb:"was good, son, maybe even the best!"}
execute if score ?task exact.state matches 2 run function exact:state/ingame_task/win_tellraw {verb:"shovels well!"}
execute if score ?task exact.state matches 3 run function exact:state/ingame_task/win_tellraw {verb:"watched the movie, too!"}
execute if score ?task exact.state matches 4 run function exact:state/ingame_task/win_tellraw {verb:"has strong bones!"}
execute if score ?task exact.state matches 5 run function exact:state/ingame_task/win_tellraw {verb:"needs a wrist protector!"}
execute if score ?task exact.state matches 6 run function exact:state/ingame_task/win_tellraw {verb:"is gonna mine those diamonds!"}
execute if score ?task exact.state matches 7 run function exact:state/ingame_task/win_tellraw {verb:"is a Londoner!"}
execute if score ?task exact.state matches 8 run function exact:state/ingame_task/win_tellraw {verb:"is wanted in Gävle!"}
execute if score ?task exact.state matches 9 run function exact:state/ingame_task/win_tellraw {verb:"is lit fam!"}
execute if score ?task exact.state matches 10 run function exact:state/ingame_task/win_tellraw {verb:"lives and dies by the ball!"}
execute if score ?task exact.state matches 11 run function exact:state/ingame_task/win_tellraw {verb:"is biting hair!"}
execute if score ?task exact.state matches 12 run function exact:state/ingame_task/win_tellraw {verb:"should have their bow license removed!"}
execute if score ?task exact.state matches 13 run function exact:state/ingame_task/win_tellraw {verb:"is going to save the planet!"}
execute if score ?task exact.state matches 14 run function exact:state/ingame_task/win_tellraw {verb:"did unspeakable things to bees!"}
execute if score ?task exact.state matches 15 run function exact:state/ingame_task/win_tellraw {verb:"took lessons from Be$o$!"}
execute if score ?task exact.state matches 16 run function exact:state/ingame_task/win_tellraw {verb:"is mining and crafting!"}
execute if score ?task exact.state matches 17 run function exact:state/ingame_task/win_tellraw {verb:"has your full attention!"}
execute if score ?task exact.state matches 18 run function exact:state/ingame_task/win_tellraw {verb:"rejects their humanity!"}
execute if score ?task exact.state matches 19 run function exact:state/ingame_task/win_tellraw {verb:"can count better than Valve!"}
execute if score ?task exact.state matches 20 run function exact:state/ingame_task/win_tellraw {verb:"costs 4 elixir!"}
execute if score ?task exact.state matches 21 run function exact:state/ingame_task/win_tellraw {verb:"understood the reference!"}
execute if score ?task exact.state matches 22 run function exact:state/ingame_task/win_tellraw {verb:"is not going to systemet tonight!"}
execute if score ?task exact.state matches 23 run function exact:state/ingame_task/win_tellraw {verb:"touched grass AND water!"}
execute if score ?task exact.state matches 24 run function exact:state/ingame_task/win_tellraw {verb:"beelined for the grass!"}
execute if score ?task exact.state matches 25 run function exact:state/ingame_task/win_tellraw {verb:"is eating good tonight!"}
execute if score ?task exact.state matches 26 run function exact:state/ingame_task/win_tellraw {verb:"works for Kiruna!"}
execute if score ?task exact.state matches 27 run function exact:state/ingame_task/win_tellraw {verb:"works for SAAB!"}
execute if score ?task exact.state matches 28 run function exact:state/ingame_task/win_tellraw {verb:"works for Oppenheimer!"}
execute if score ?task exact.state matches 29 run function exact:state/ingame_task/win_tellraw {verb:"works for Gordon Ramsay!"}
execute if score ?task exact.state matches 30 run function exact:state/ingame_task/win_tellraw {verb:"works for Boeing!"}

# add to outro stats
scoreboard players add @s exact.stats.wins 1

# Cut the round short once enough players have finished
function exact:state/ingame_task/check_cutoff

# check how many players are still in it and have not finished yet,
# and give points based on that
execute store result storage exact.temp points int 2 if entity @a[tag=!admin,tag=!exact.dead,tag=!exact.win]
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
