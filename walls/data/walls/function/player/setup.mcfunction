# ============================================================
# walls:player/setup
# Called by: walls:on/gamestart, walls:on/player/latejoin
# Executor:  The player being kitted out
#
# The only items anyone is ever handed for free. Respawns do not
# re-issue any of this — keep_inventory is on, so what you die
# with is what you come back with.
# ============================================================

function main:util/reset_player
gamemode survival @s
#   reset_player empties the recipe book, and this game is built
#   around crafting what the Miner sells
recipe give @s *

give @s stone_sword
give @s stone_pickaxe[enchantments={efficiency:3}]
give @s stone_axe[enchantments={efficiency:3}]
give @s stone_shovel[enchantments={efficiency:3}]
give @s prismarine_crystals 8

execute if entity @s[team=main.it] run function walls:player/armor_it
execute if entity @s[team=main.data] run function walls:player/armor_data

function walls:player/send_to_spawn
