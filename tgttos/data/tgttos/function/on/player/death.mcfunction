# ============================================================
# tgttos:on/player/death
# Called by: main:private/call/death
# Executor:  Player who died
#
# Attacker can be selected with @a[tag=on.attacker].
# NOTE: immediate_respawn is on, so @s has already respawned on
# their platform by now, and dying cleared their effects.
#
# Most deaths here are falls, not hits — but the attacker MAIN
# hands us is whoever damaged the victim in the last 5 seconds,
# so cutting the bridge out from under somebody still counts as
# a kill, which is exactly what it should count as.
# ============================================================

execute unless score ?superstate main.state matches 3 run return 0
execute if entity @s[tag=admin] run return 0

# MAIN tags any attacker, including the victim themselves. Marking
# the victim keeps them off their own bounty.
tag @s add tgttos.victim

gamemode adventure @s
function tgttos:player/give_regen

# --- DEATH MESSAGE ---
execute if entity @a[tag=on.attacker,tag=!tgttos.victim] run tellraw @a [{selector:"@s"},{text:" was dropped by ",color:"gray"},{selector:"@a[tag=on.attacker,tag=!tgttos.victim]"}]
execute unless entity @a[tag=on.attacker,tag=!tgttos.victim] run tellraw @a [{selector:"@s"},{text:" fell",color:"gray"}]

# --- KILL CREDIT ---
#   the advancement only fires on a hit that finishes somebody off,
#   which almost never happens in a game decided by gravity, so the
#   credit is settled here instead
execute as @a[tag=on.attacker,tag=!tgttos.victim] run function tgttos:events/kill_reward

tag @s remove tgttos.victim
