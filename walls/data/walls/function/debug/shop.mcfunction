# ============================================================
# walls:debug/shop
# Called by: walls:debug/check
# Executor:  One shop villager
#
# A count of 0 means the Offers path never took — see the comment
# at the top of walls:map/shop/miner.
# ============================================================

execute store result score #dbg walls.temp run data get entity @s Offers.Recipes
tellraw @a [{text:" ",color:"gray"},{selector:"@s"},{text:" trades (want 7): ",color:"gray"},{score:{name:"#dbg",objective:"walls.temp"},color:"white"}]
