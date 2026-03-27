# ============================================================
# gamename:events/on_player_kill
# Called by: advancement reward (gamename:player_kill)
# Executor:  Player who got the kill advancement trigger
# ============================================================

# Re-arm this trigger for repeat use.
advancement revoke @s only gamename:player_kill

# Only count triggers during active gameplay phase.
execute unless score ?phase gamename.state matches 1 run return 0

scoreboard players add @s gamename.stats.kills 1
tellraw @s {"text":"Kill trigger +1","color":"green"}
