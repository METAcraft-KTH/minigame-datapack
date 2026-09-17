# ============================================================
# Called by: main:superstate/1/go_to_state_2 (once)
# Executor:  Server
# 
# Runs ONCE, at the start of superstate 2.
# Places random pickers on teams, then locks in the team
# of every online player.
# 
# ============================================================

# players who never picked get a random team too
execute as @a[tag=!admin] unless score @s main.team matches 1..3 run scoreboard players set @s main.team 3

# one player at a time, so each one sees the counts updated by the previous one
execute as @a[scores={main.team=3},sort=random] run function main:team/assign_random

# lock everyone in and take the selector away
tag @a add main.team_locked
scoreboard players reset * main.team_pick
dialog clear @a
clear @a carrot_on_a_stick[custom_data~{main_team_selector:1b}]
