# ============================================================
# walls:map/shop/trapper
# Called by: walls:map/setup
# Executor:  Server, positioned where the villager should stand
#
# Sells everything you need to make the enemy's approach hurt.
# See walls:map/shop/miner for why the list goes through storage.
# ============================================================

data modify storage walls:shop offers set value []
data modify storage walls:shop offers append value {buy:{id:"minecraft:prismarine_crystals",count:1},sell:{id:"minecraft:tnt",count:3},maxUses:9999,uses:0,rewardExp:false,xp:0,priceMultiplier:0.0f}
data modify storage walls:shop offers append value {buy:{id:"minecraft:prismarine_crystals",count:1},sell:{id:"minecraft:redstone",count:16},maxUses:9999,uses:0,rewardExp:false,xp:0,priceMultiplier:0.0f}
data modify storage walls:shop offers append value {buy:{id:"minecraft:prismarine_crystals",count:1},sell:{id:"minecraft:quartz",count:8},maxUses:9999,uses:0,rewardExp:false,xp:0,priceMultiplier:0.0f}
data modify storage walls:shop offers append value {buy:{id:"minecraft:prismarine_crystals",count:1},sell:{id:"minecraft:slime_block",count:4},maxUses:9999,uses:0,rewardExp:false,xp:0,priceMultiplier:0.0f}
data modify storage walls:shop offers append value {buy:{id:"minecraft:prismarine_crystals",count:1},sell:{id:"minecraft:string",count:16},maxUses:9999,uses:0,rewardExp:false,xp:0,priceMultiplier:0.0f}
data modify storage walls:shop offers append value {buy:{id:"minecraft:prismarine_crystals",count:1},sell:{id:"minecraft:arrow",count:4},maxUses:9999,uses:0,rewardExp:false,xp:0,priceMultiplier:0.0f}
data modify storage walls:shop offers append value {buy:{id:"minecraft:prismarine_crystals",count:2},sell:{id:"minecraft:pointed_dripstone",count:4},maxUses:9999,uses:0,rewardExp:false,xp:0,priceMultiplier:0.0f}

summon villager ~ ~ ~ {Tags:["walls.shop","walls.tmp"],Team:"walls.shop",CustomName:{text:"Trapper",color:"gray"},CustomNameVisible:1b,NoAI:1b,Silent:1b,Invulnerable:1b,PersistenceRequired:1b,VillagerData:{type:"minecraft:plains",profession:"minecraft:fletcher",level:5}}
data modify entity @n[type=villager,tag=walls.tmp] Offers.Recipes set from storage walls:shop offers
tag @n[type=villager,tag=walls.tmp] remove walls.tmp
