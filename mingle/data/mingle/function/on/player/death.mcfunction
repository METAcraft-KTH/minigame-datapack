# ============================================================
# mingle:on/player/death
# Called by: main:private/call/death
# Executor:  Player who died
# ============================================================

gamemode spectator @s
tag @s remove mingle.in_cp
tag @s remove mingle.player.correct
tag @s add mingle.loser
tellraw @s {"text":"You died and are out for this minigame.","color":"red"}
