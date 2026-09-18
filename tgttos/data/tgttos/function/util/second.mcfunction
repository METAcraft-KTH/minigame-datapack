# ============================================================
# tgttos:util/second
# Called by: tgttos:_tick (every 20 ticks)
# Executor:  Server
# ============================================================

scoreboard players set ?sec_timer tgttos.timer 0

function tgttos:objective/bossbar

# --- RESTOCK ---
#   adventure mode still lets people throw their kit on the floor,
#   and a player with no concrete has nothing left to do. Anything
#   missing from the inventory or the off hand comes straight back.
execute as @a[tag=!admin,gamemode=adventure] unless items entity @s container.* minecraft:bow unless items entity @s weapon.offhand minecraft:bow run function tgttos:player/give_bow
execute as @a[tag=!admin,gamemode=adventure] unless items entity @s container.* minecraft:diamond_pickaxe unless items entity @s weapon.offhand minecraft:diamond_pickaxe run function tgttos:player/give_pick
execute as @a[team=main.data,tag=!admin,gamemode=adventure] unless items entity @s container.* minecraft:pink_concrete unless items entity @s weapon.offhand minecraft:pink_concrete run function tgttos:player/give_concrete_data
execute as @a[team=main.it,tag=!admin,gamemode=adventure] unless items entity @s container.* minecraft:light_blue_concrete unless items entity @s weapon.offhand minecraft:light_blue_concrete run function tgttos:player/give_concrete_it

# --- LOOSE ITEMS ---
#   nothing in this game is meant to be picked up off the floor
kill @e[type=item,x=20000,y=64,z=60050,distance=..400]
