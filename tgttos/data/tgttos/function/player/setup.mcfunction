# ============================================================
# tgttos:player/setup
# Called by: tgttos:on/gamestart, tgttos:on/player/latejoin
# Executor:  The player being kitted out
#
# The kit is fixed and never changes: nothing in this game is
# earned, bought or dropped. keep_inventory is on, so a respawn
# does not come back through here.
# ============================================================

function main:util/reset_player
gamemode adventure @s

function tgttos:player/give_pick
function tgttos:player/give_bow
give @s minecraft:arrow 3
execute if entity @s[team=main.data] run function tgttos:player/give_concrete_data
execute if entity @s[team=main.it] run function tgttos:player/give_concrete_it
#   a second stack for the off hand, so you can bridge and shoot at once
execute if entity @s[team=main.data] run item replace entity @s weapon.offhand with minecraft:pink_concrete[minecraft:can_place_on={},minecraft:tooltip_display={hidden_components:["can_place_on"]}] 64
execute if entity @s[team=main.it] run item replace entity @s weapon.offhand with minecraft:light_blue_concrete[minecraft:can_place_on={},minecraft:tooltip_display={hidden_components:["can_place_on"]}] 64

function tgttos:player/give_regen
function tgttos:player/send_to_spawn
