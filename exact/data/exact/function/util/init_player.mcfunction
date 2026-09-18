# ============================================================
# exact:util/init_player
# Called by: exact:on/gamestart, exact:util/enroll
# Executor:  The player to put into the game
#
# Hearts are this game's life counter, so every player starts
# with exactly 5 of them and a full health bar. Resistance and
# natural_health_regeneration are handled elsewhere, so nothing
# but exact's own /damage can move that bar.
# ============================================================

attribute @s minecraft:max_health base set 10

# Top the bar back up: max_health only clamps health downwards, it never
# heals, so somebody who walked in on 2 hearts would keep them otherwise.
effect give @s minecraft:instant_health 1 10 true

gamemode adventure @s
