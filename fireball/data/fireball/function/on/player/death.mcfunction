# ============================================================
# fireball:on/player/death
# Called by: main:private/call/death
# Executor:  Player who died
#
# Attacker can be selected with @a[tag=on.attacker], but almost
# nobody dies to a player here — it is the fireball's explosion
# or the lava underneath the hole it left.
#
# NOTE: immediate_respawn is on, so @s has already respawned on
# Data's platform by the time this runs — fireball:on/gamestart set
# the respawn point there, in the nether. on_death moves them.
# ============================================================

execute unless score ?superstate main.state matches 3 run return 0
execute if entity @s[tag=admin] run return 0

tellraw @a [{selector:"@s"},{text:" is out!",color:"gray"}]
execute in minecraft:the_nether run function fireball:gameplay/on_death
