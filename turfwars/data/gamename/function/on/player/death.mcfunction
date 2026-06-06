# ============================================================
# Called by: main:private/call/death
# Executor:  Player who died
# 
# Triggers on player death.
# Attacker can be selected with "execute on attacker"
# or [tag=on.attacker]
# 
# ============================================================

gamemode spectator @s
tellraw @s {"text":"You died. You will respawn for the next round.","color":"red"}