# ============================================================
# walls:map/shop/trickster
# Called by: walls:map/setup
# Executor:  Server, positioned where the villager should stand
#
# Sells the weird stuff.
#
# The spawners carry no block entity data: minecraft:spawner is an
# operator block, so the game throws minecraft:block_entity_data away
# unless the placer is op AND in creative. The items are just marked
# with custom_data, and walls:spawner/* writes the real block entity
# once the advancement tells us one was placed.
# See walls:map/shop/miner for why the list goes through storage.
# ============================================================

data modify storage walls:shop offers set value []
data modify storage walls:shop offers append value {buy:{id:"minecraft:prismarine_crystals",count:6},sell:{id:"minecraft:ender_pearl",count:1},maxUses:9999,uses:0,rewardExp:false,xp:0,priceMultiplier:0.0f}
data modify storage walls:shop offers append value {buy:{id:"minecraft:prismarine_crystals",count:8},sell:{id:"minecraft:spawner",count:1,components:{"minecraft:custom_data":{walls_spawner:"cow"},"minecraft:item_name":{text:"Cow Spawner",color:"green"},"minecraft:lore":[{text:"Spawns cows in any light",color:"gray",italic:false}]}},maxUses:9999,uses:0,rewardExp:false,xp:0,priceMultiplier:0.0f}
data modify storage walls:shop offers append value {buy:{id:"minecraft:prismarine_crystals",count:16},sell:{id:"minecraft:spawner",count:1,components:{"minecraft:custom_data":{walls_spawner:"zombie"},"minecraft:item_name":{text:"Zombie Spawner",color:"green"},"minecraft:lore":[{text:"Spawns helmeted zombies in any light",color:"gray",italic:false},{text:"They join your team and hunt the other one",color:"gray",italic:false}]}},maxUses:9999,uses:0,rewardExp:false,xp:0,priceMultiplier:0.0f}
data modify storage walls:shop offers append value {buy:{id:"minecraft:prismarine_crystals",count:18},sell:{id:"minecraft:spawner",count:1,components:{"minecraft:custom_data":{walls_spawner:"skeleton"},"minecraft:item_name":{text:"Skeleton Spawner",color:"green"},"minecraft:lore":[{text:"Spawns helmeted skeletons in any light",color:"gray",italic:false},{text:"They join your team and hunt the other one",color:"gray",italic:false}]}},maxUses:9999,uses:0,rewardExp:false,xp:0,priceMultiplier:0.0f}
data modify storage walls:shop offers append value {buy:{id:"minecraft:prismarine_crystals",count:7},sell:{id:"minecraft:trident",count:1,components:{"minecraft:custom_data":{walls_boom:1b},"minecraft:item_name":{text:"Volatile Trident",color:"red"},"minecraft:lore":[{text:"Blows up wherever it lands",color:"gray",italic:false}]}},maxUses:9999,uses:0,rewardExp:false,xp:0,priceMultiplier:0.0f}
data modify storage walls:shop offers append value {buy:{id:"minecraft:prismarine_crystals",count:13},sell:{id:"minecraft:golden_sword",count:1,components:{"minecraft:enchantments":{"minecraft:knockback":3}}},maxUses:9999,uses:0,rewardExp:false,xp:0,priceMultiplier:0.0f}
data modify storage walls:shop offers append value {buy:{id:"minecraft:prismarine_crystals",count:7},sell:{id:"minecraft:paper",count:1,components:{"minecraft:custom_data":{walls_coupon:1b},"minecraft:rarity":"epic","minecraft:item_name":{text:"Insta-Respawn Coupon",color:"gold"},"minecraft:lore":[{text:"Consumed on death — respawn instantly",color:"gray",italic:false}]}},maxUses:9999,uses:0,rewardExp:false,xp:0,priceMultiplier:0.0f}

summon villager ~ ~ ~ {Tags:["walls.shop","walls.tmp"],Team:"walls.shop",CustomName:{text:"Trickster",color:"gray"},CustomNameVisible:1b,NoAI:1b,Silent:1b,Invulnerable:1b,PersistenceRequired:1b,VillagerData:{type:"minecraft:swamp",profession:"minecraft:cleric",level:5}}
data modify entity @n[type=villager,tag=walls.tmp] Offers.Recipes set from storage walls:shop offers
tag @n[type=villager,tag=walls.tmp] remove walls.tmp
