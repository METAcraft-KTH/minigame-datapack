# ============================================================
# fireball:on/player/latejoin
# Called by: main:private/call/latejoin
# Executor:  Player who joined after game start
#
# This is an elimination game on a floor that is already full of
# holes by now, and a late arrival would have a survival time that
# makes no sense next to everyone else's. They spectate.
# ============================================================

execute if entity @s[tag=admin] run return 0

gamemode spectator @s
# warn-off target-selector-no-dimension
execute at @n[tag=fireball.arena_center,type=marker] run tp @s ~ ~ ~
tellraw @s {text:"Not Rocket League is already in progress. You are now spectating.",color:"yellow"}
