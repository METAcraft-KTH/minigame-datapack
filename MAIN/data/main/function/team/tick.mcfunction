# ============================================================
# Called by: main:superstate/0/tick, main:superstate/1/tick
# Executor:  Server
# 
# Runs per tick while in the lobby.
# Hands out the team selector, opens the menu on right-click,
# and applies team picks sent through /trigger.
# 
# ============================================================

# --- HAND OUT THE TEAM SELECTOR ---
#   anyone who doesn't have one anywhere in their inventory gets one
execute as @a unless items entity @s container.* *[custom_data~{main_team_selector:1b}] unless items entity @s weapon.offhand *[custom_data~{main_team_selector:1b}] unless items entity @s player.cursor *[custom_data~{main_team_selector:1b}] unless items entity @s player.crafting.* *[custom_data~{main_team_selector:1b}] run function main:team/give_selector
#   dropped selectors would pile up since we keep handing out new ones
execute as @e[type=item] if items entity @s contents *[custom_data~{main_team_selector:1b}] run kill @s

# --- OPEN THE MENU ON RIGHT-CLICK ---
#   main.used_cos is reset for everyone in _tick
execute as @a[scores={main.used_cos=1..}] if items entity @s weapon.* *[custom_data~{main_team_selector:1b}] run function main:team/open_menu

# --- APPLY PICKS ---
execute as @a[scores={main.team_pick=1..}] run function main:team/pick

# --- RE-APPLY SAVED TEAMS ---
#   end_game and some minigames kick players out of teams, so main.team is the source of truth
team join main.data @a[scores={main.team=1},team=!main.data]
team join main.it @a[scores={main.team=2},team=!main.it]

# --- LET UNLOCKED PLAYERS PICK ---
#   runs after pick, since resetting a trigger score also disables it
scoreboard players enable @a[tag=!main.team_locked] main.team_pick
