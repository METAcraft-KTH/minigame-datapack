# ============================================================
# tf:on/player/latejoin
# Called by: main:private/call/latejoin
# Executor:  Player who joined after game start
# ============================================================

gamemode adventure @s
#gamemode spectator @s
#tag @s remove tf.in_cp
#tag @s remove tf.player.correct
#tag @s add tf.loser
#tellraw @s {"text":"A Mingle match is already in progress. You are spectating.","color":"yellow"}
