# ============================================================
# 
# This function always runs every tick, forever.
# 
# ============================================================

# assign unique ids to all players
execute as @a unless score @s main.id matches -2147483648..2147483647 run function main:private/first_join

# if we're in a game, call that game's tick function repeatedly
execute if score ?state main.state matches 3 run function main:private/call/gametick


# --- DETECT REJOINS AND LATE JOINS WHILE INGAME ---
#   for sake of simplicity i am only considering INGAME-ingame as ingame (?state is 3)
#   game opening cutscene is managed by main, and if you join at the end, the game's already over so you can just go to lobby

# detect player disconnects and rejoins
execute if score ?state main.state matches 3 as @a[scores={main.disconnect=1..}] run function main:private/call/rejoin

# detect player joining AFTER the game has started
execute if score ?state main.state matches 3 as @a unless score @s main.iwashere matches 1 run function main:private/call/latejoin