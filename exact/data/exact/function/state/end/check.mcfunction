# ============================================================
# exact:state/end/check
# Called by: exact:state/ingame_wait/exit (once per round)
# Executor:  Server
#
# Decides whether the elimination is over. Returns 1 and ends
# the game if it is, 0 if there are still two sides in it.
#
# Only online players count -- a team that has all logged out
# has stopped playing, and anyone who comes back pays for the
# rounds they missed anyway (exact:util/catchup).
# ============================================================

execute store result score #alive_data exact.state if entity @a[tag=!admin,tag=!exact.dead,scores={main.team=1}]
execute store result score #alive_it exact.state if entity @a[tag=!admin,tag=!exact.dead,scores={main.team=2}]
execute store result score #alive_all exact.state if entity @a[tag=!admin,tag=!exact.dead]

# -1 means "no result yet, play another round"
scoreboard players set #winner exact.state -1

# One team has been wiped out. Only meaningful for a team that had players
# at game start (?had_data / ?had_it), or a one-team lobby would "win" in
# round one against an opponent that never existed.
execute if score ?had_data exact.state matches 1.. if score ?had_it exact.state matches 1.. if score #alive_data exact.state matches 1.. if score #alive_it exact.state matches 0 run scoreboard players set #winner exact.state 1
execute if score ?had_data exact.state matches 1.. if score ?had_it exact.state matches 1.. if score #alive_it exact.state matches 1.. if score #alive_data exact.state matches 0 run scoreboard players set #winner exact.state 2

# One player left standing ends it too, even if both teams technically
# survive -- there is nobody left for them to outlast.
execute if score #alive_all exact.state matches 1 if score #alive_data exact.state matches 1 run scoreboard players set #winner exact.state 1
execute if score #alive_all exact.state matches 1 if score #alive_it exact.state matches 1 run scoreboard players set #winner exact.state 2

# A survivor with no team at all (a late joiner who never got one) still
# ends the game -- there is just nobody to hand the win to.
execute if score #alive_all exact.state matches 1 if score #winner exact.state matches -1 run scoreboard players set #winner exact.state 0

# Everyone went out on the same round (or the server emptied): no winner
execute if score #alive_all exact.state matches 0 run scoreboard players set #winner exact.state 0

execute if score #winner exact.state matches -1 run return 0

function exact:state/end/finish
return 1
