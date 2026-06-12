# ============================================================
# tf:on/player/death
# Called by: main:private/call/death
# Executor:  Player who died
# ============================================================

tp @s 40000 64 50000
gamemode adventure @s

#gamemode spectator @s
#tag @s remove tf.in_cp
#tag @s remove tf.player.correct
#tag @s add tf.loser
#tellraw @s {"text":"You died and are out for this minigame.","color":"red"}
