# ============================================================
# walls:map/shop/miner
# Called by: walls:map/setup
# Executor:  Server, positioned where the villager should stand
#
# Sells raw materials. Prices are one recipe per line, so they
# are easy to tweak.
# ============================================================

summon villager ~ ~ ~ {Tags:["walls.shop","walls.tmp"],Team:"walls.shop",CustomName:{text:"Miner",color:"gray"},CustomNameVisible:1b,NoAI:1b,Silent:1b,Invulnerable:1b,PersistenceRequired:1b,VillagerData:{type:"minecraft:plains",profession:"minecraft:mason",level:5},Offers:{Recipes:[]}}

data modify entity @n[type=villager,tag=walls.tmp] Offers.Recipes append value {buy:{id:"minecraft:prismarine_crystals",count:1},sell:{id:"minecraft:oak_log",count:8},maxUses:9999,uses:0,rewardExp:false,xp:0,priceMultiplier:0.0f}
data modify entity @n[type=villager,tag=walls.tmp] Offers.Recipes append value {buy:{id:"minecraft:prismarine_crystals",count:1},sell:{id:"minecraft:cobblestone",count:32},maxUses:9999,uses:0,rewardExp:false,xp:0,priceMultiplier:0.0f}
data modify entity @n[type=villager,tag=walls.tmp] Offers.Recipes append value {buy:{id:"minecraft:prismarine_crystals",count:1},sell:{id:"minecraft:stone",count:24},maxUses:9999,uses:0,rewardExp:false,xp:0,priceMultiplier:0.0f}
data modify entity @n[type=villager,tag=walls.tmp] Offers.Recipes append value {buy:{id:"minecraft:prismarine_crystals",count:1},sell:{id:"minecraft:iron_ingot",count:2},maxUses:9999,uses:0,rewardExp:false,xp:0,priceMultiplier:0.0f}
data modify entity @n[type=villager,tag=walls.tmp] Offers.Recipes append value {buy:{id:"minecraft:prismarine_crystals",count:1},sell:{id:"minecraft:lapis_lazuli",count:6},maxUses:9999,uses:0,rewardExp:false,xp:0,priceMultiplier:0.0f}
#   the bottle is a token: walls:econ/redeem_xp swaps it for 16 XP the tick it lands in an inventory
data modify entity @n[type=villager,tag=walls.tmp] Offers.Recipes append value {buy:{id:"minecraft:prismarine_crystals",count:1},sell:{id:"minecraft:experience_bottle",count:1,components:{"minecraft:custom_data":{walls_xp:1b},"minecraft:item_name":{text:"16 XP",color:"green"}}},maxUses:9999,uses:0,rewardExp:false,xp:0,priceMultiplier:0.0f}
data modify entity @n[type=villager,tag=walls.tmp] Offers.Recipes append value {buy:{id:"minecraft:prismarine_crystals",count:2},sell:{id:"minecraft:diamond",count:1},maxUses:9999,uses:0,rewardExp:false,xp:0,priceMultiplier:0.0f}

tag @n[type=villager,tag=walls.tmp] remove walls.tmp
