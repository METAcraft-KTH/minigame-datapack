# ============================================================
# Called by: main:superstate/4/slide/rank_next, show_own_score
# Executor:  Any
# 
# Input:  #ticks main.temp (the score to format, not always ticks)
# Output: storage main:temp formatted (string)
# 
# Formats the score according to stats[0].numberformat.
# Times are rounded down, since these are results, not countdowns.
# 
# ============================================================

# --- SPLIT INTO PARTS ---
execute store result storage main:temp num.raw int 1 run scoreboard players get #ticks main.temp
execute store result storage main:temp num.total_sec int 1 run compute default integer main:time/exact/total_sec
execute store result storage main:temp num.min int 1 run compute default integer main:time/exact/min
execute store result storage main:temp num.sec_tens int 1 run compute default integer main:time/exact/sec_tens
execute store result storage main:temp num.sec_ones int 1 run compute default integer main:time/exact/sec_ones
execute store result storage main:temp num.hundredths_tens int 1 run compute default integer main:time/exact/hundredths_tens
execute store result storage main:temp num.hundredths_ones int 1 run compute default integer main:time/exact/hundredths_ones

# --- JOIN THE PARTS NEEDED BY THE NUMBER FORMAT ---
execute store result score #numberformat main.temp run data get storage main:temp stats[0].numberformat
execute if score #numberformat main.temp matches 0 run function main:superstate/4/slide/format/0 with storage main:temp num
execute if score #numberformat main.temp matches 1 run function main:superstate/4/slide/format/1 with storage main:temp num
execute if score #numberformat main.temp matches 2 run function main:superstate/4/slide/format/2 with storage main:temp num
execute if score #numberformat main.temp matches 3 run function main:superstate/4/slide/format/3 with storage main:temp num
