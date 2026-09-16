# ============================================================
# Called by: main:superstate/4/slide/rank, and itself (once per row, max 5)
# Executor:  Server
# Macro args: stats[0] of the outro config, uses {sortby}
# 
# Picks the best unranked player and adds them as row #row.
# Tied players get their own rows, but share the same place.
# 
# ============================================================

# --- STOP IF EVERYONE IS ALREADY RANKED ---
execute unless entity @a[scores={main.temp.rank=0}] run return 0

# --- FIND THE BEST SCORE AMONG UNRANKED PLAYERS ---
#   start from any unranked player's score (an unset score would count as 0),
#   then ">" keeps the biggest score and "<" keeps the smallest
scoreboard players operation #best main.temp = @a[scores={main.temp.rank=0},limit=1] main.temp.stat
$scoreboard players operation #best main.temp $(sortby) @a[scores={main.temp.rank=0}] main.temp.stat

# --- GIVE THIS ROW TO ONE PLAYER WITH THAT SCORE ---
execute as @a[scores={main.temp.rank=0}] if score @s main.temp.stat = #best main.temp run tag @s add main.outro.best
scoreboard players operation @a[tag=main.outro.best,limit=1] main.temp.rank = #row main.temp
tag @a remove main.outro.best

# --- PLACE ---
#   ties share the place of the first tied row, e.g. 1, 1, 3, 4, 4
execute unless score #best main.temp = #prev main.temp run scoreboard players operation #place main.temp = #row main.temp
scoreboard players operation #prev main.temp = #best main.temp

# --- ADD ROW ---
scoreboard players operation #ticks main.temp = #best main.temp
function main:superstate/4/slide/format
execute store result storage main:temp row.row int 1 run scoreboard players get #row main.temp
execute store result storage main:temp row.place int 1 run scoreboard players get #place main.temp
data modify storage main:temp row.value set from storage main:temp formatted
function main:superstate/4/slide/macro_add_row with storage main:temp row

# --- NEXT ROW ---
scoreboard players add #row main.temp 1
execute if score #row main.temp matches ..5 run function main:superstate/4/slide/rank_next with storage main:temp stats[0]
