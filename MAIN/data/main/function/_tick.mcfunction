# ============================================================
# 
# This function always runs every tick, forever.
# 
# ============================================================

# assign unique ids to all players
execute as @a unless score @s main.id matches -2147483648..2147483647 run function main:private/first_join

# --- INGAME EVENT TRIGGERS ---
#   for sake of simplicity i am only considering INGAME-ingame as ingame (?superstate is 3)
#   game opening cutscene is managed by main, and if you join at the end, the game's already over so you can just go to lobby

# player death
execute if score ?superstate main.state matches 3 as @a[scores={main.death=1..}] at @s run function main:private/call/death
scoreboard players reset @a[scores={main.death=1..}] main.death
# no "player kill player" general event trigger, because that can and should be done with "execute on attacker"

# detect player disconnects and rejoins
execute if score ?superstate main.state matches 3 as @a[scores={main.disconnect=1..}] at @s run function main:private/call/rejoin
scoreboard players reset @a[scores={main.disconnect=1..}] main.disconnect

# detect player joining AFTER the game has started
execute if score ?superstate main.state matches 3 as @a unless score @s main.iwashere matches 1 at @s run function main:private/call/latejoin


# --- SUPERSTATE MANAGEMENT ---
execute if score ?superstate main.state matches 0 run function main:superstate/0/tick
execute if score ?superstate main.state matches 1 run function main:superstate/1/tick
execute if score ?superstate main.state matches 2 run function main:superstate/2/tick
execute if score ?superstate main.state matches 3 run function main:private/call/gametick
execute if score ?superstate main.state matches 4 run function main:superstate/4/tick
#   should something happen in superstate 5?

