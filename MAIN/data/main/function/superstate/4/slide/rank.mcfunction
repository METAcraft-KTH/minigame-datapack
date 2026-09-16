# ============================================================
# Called by: main:superstate/4/show_next_slide (once per slide)
# Executor:  Server
# Macro args: stats[0] of the outro config, uses {objective}
# 
# Ranks the top 5 online players of the objective,
# and stores one text component per row in storage main:temp rows.
# 
# ============================================================

# --- COPY THE STAT, SO THE REST DOESN'T NEED MACROS ---
#   only players that actually have a score get ranked
scoreboard players reset @a main.temp.stat
$execute as @a if score @s $(objective) matches -2147483648.. run scoreboard players operation @s main.temp.stat = @s $(objective)

# --- RESET RANKS ---
#   0 = has a score but isn't ranked yet
#   1-5 = which row the player is shown in
scoreboard players reset @a main.temp.rank
scoreboard players set @a[scores={main.temp.stat=-2147483648..}] main.temp.rank 0

# --- FILL ROWS 1-5 ---
data remove storage main:temp rows
scoreboard players reset #prev main.temp
scoreboard players set #row main.temp 1
function main:superstate/4/slide/rank_next with storage main:temp stats[0]
