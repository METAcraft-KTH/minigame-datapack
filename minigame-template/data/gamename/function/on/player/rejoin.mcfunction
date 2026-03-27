# ============================================================
# Called by: main:private/call/rejoin
# Executor:  Player who rejoined the server
# 
# Triggers on rejoin, regardless of when
# they disconnected.
# INCLUDING FIRST-TIME JOINERS!
# 
# If you want to only target late joiners, filter:
#       unless score @s main.iwashere matches 1
# But, it's better to do it in the latejoin function,
# because both this and latejoin will run at the same time
# if it is a late join.
# 
# ============================================================

# Late joiners are handled in on/player/latejoin.
execute unless score @s main.iwashere matches 1 run return 0

# During active gameplay, bring non-admin players back into adventure.
execute if score ?phase gamename.state matches 1 as @s[tag=!admin] run gamemode adventure

# Outside gameplay rounds, keep players in spectator.
execute unless score ?phase gamename.state matches 1 as @s[tag=!admin] run gamemode spectator