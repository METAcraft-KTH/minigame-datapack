# ============================================================
# tf:events/on_consume_item
# Called by: advancement reward (tf:consume_item)
# Executor:  Player who consumed the configured item
# ============================================================

# Re-arm this trigger for repeat use.
advancement revoke @s only tf:consume_item

# Only count triggers during active gameplay phase.
execute unless score ?phase tf.state matches 1 run return 0

scoreboard players add @s tf.stats.trigs 1
tellraw @s {"text":"Consume trigger +1","color":"green"}
