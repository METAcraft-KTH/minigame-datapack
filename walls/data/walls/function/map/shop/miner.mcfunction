# ============================================================
# walls:map/shop/miner
# Called by: walls:map/setup
# Executor:  Server, positioned where the villager should stand
#
# Sells raw materials. Prices are one recipe per line, so they
# are easy to tweak.
#
# The recipe list is assembled in storage and handed over in a
# single data modify. Appending straight onto the villager does not
# work: a villager with no trades does not write an Offers field at
# all, so Offers.Recipes is not a path that exists yet, and every
# append fails with nothing to show for it. "set" creates the path,
# "append" needs it to already be there.
# ============================================================

data modify storage walls:shop offers set value []
data modify storage walls:shop offers append value {buy:{id:"minecraft:prismarine_crystals",count:1},sell:{id:"minecraft:oak_log",count:8},maxUses:9999,uses:0,rewardExp:false,xp:0,priceMultiplier:0.0f}
data modify storage walls:shop offers append value {buy:{id:"minecraft:prismarine_crystals",count:1},sell:{id:"minecraft:cobblestone",count:32},maxUses:9999,uses:0,rewardExp:false,xp:0,priceMultiplier:0.0f}
data modify storage walls:shop offers append value {buy:{id:"minecraft:prismarine_crystals",count:1},sell:{id:"minecraft:stone",count:24},maxUses:9999,uses:0,rewardExp:false,xp:0,priceMultiplier:0.0f}
data modify storage walls:shop offers append value {buy:{id:"minecraft:prismarine_crystals",count:1},sell:{id:"minecraft:iron_ingot",count:2},maxUses:9999,uses:0,rewardExp:false,xp:0,priceMultiplier:0.0f}
data modify storage walls:shop offers append value {buy:{id:"minecraft:prismarine_crystals",count:1},sell:{id:"minecraft:lapis_lazuli",count:6},maxUses:9999,uses:0,rewardExp:false,xp:0,priceMultiplier:0.0f}
#   the bottle is a token: walls:econ/redeem_xp swaps it for 16 XP the tick it lands in an inventory
data modify storage walls:shop offers append value {buy:{id:"minecraft:prismarine_crystals",count:1},sell:{id:"minecraft:experience_bottle",count:1,components:{"minecraft:custom_data":{walls_xp:1b},"minecraft:item_name":{text:"16 XP",color:"green"}}},maxUses:9999,uses:0,rewardExp:false,xp:0,priceMultiplier:0.0f}
data modify storage walls:shop offers append value {buy:{id:"minecraft:prismarine_crystals",count:2},sell:{id:"minecraft:diamond",count:1},maxUses:9999,uses:0,rewardExp:false,xp:0,priceMultiplier:0.0f}

summon villager ~ ~ ~ {Tags:["walls.shop","walls.tmp"],Team:"walls.shop",CustomName:{text:"Miner",color:"gray"},CustomNameVisible:1b,NoAI:1b,Silent:1b,Invulnerable:1b,PersistenceRequired:1b,VillagerData:{type:"minecraft:plains",profession:"minecraft:mason",level:5}}
data modify entity @n[type=villager,tag=walls.tmp] Offers.Recipes set from storage walls:shop offers
tag @n[type=villager,tag=walls.tmp] remove walls.tmp
