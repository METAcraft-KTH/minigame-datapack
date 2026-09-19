# ============================================================
# walls:on/player/death
# Called by: main:private/call/death
# Executor:  Player who died
#
# Attacker can be selected with @a[tag=on.attacker].
# NOTE: immediate_respawn is on, so @s has already respawned at
# their team's spawnpoint by now. Their death position is the one
# walls:player/tick recorded last tick.
# ============================================================

execute unless score ?superstate main.state matches 3 run return 0

# MAIN tags any attacker, including the victim themselves when someone
# blows themselves up. Marking the victim keeps them off their own bounty.
tag @s add walls.victim

# 10 second respawn, spent as a spectator
gamemode spectator @s
scoreboard players set @s walls.respawn 200

# --- DEATH MESSAGE ---
#execute if entity @a[tag=on.attacker,tag=!walls.victim] run tellraw @a [{selector:"@s"},{text:" was killed by ",color:"gray"},{selector:"@a[tag=on.attacker,tag=!walls.victim]"}]
#execute unless entity @a[tag=on.attacker,tag=!walls.victim] run tellraw @a [{selector:"@s"},{text:" died",color:"gray"}]

# --- CRYSTALS ---
#   a credited killer takes 5, and the victim gets 1 back
execute as @a[tag=on.attacker,tag=!walls.victim] run function walls:econ/kill_reward
execute if entity @a[tag=on.attacker,tag=!walls.victim] run function walls:econ/consolation
#   nobody credited: the 5 crystals are left lying where they fell
execute unless entity @a[tag=on.attacker,tag=!walls.victim] run function walls:econ/drop_death

# --- INSTA-RESPAWN COUPON ---
execute if items entity @s container.* paper[custom_data~{walls_coupon:1b}] run function walls:player/use_coupon
execute unless items entity @s container.* paper[custom_data~{walls_coupon:1b}] if items entity @s weapon.offhand paper[custom_data~{walls_coupon:1b}] run function walls:player/use_coupon

tag @s remove walls.victim
