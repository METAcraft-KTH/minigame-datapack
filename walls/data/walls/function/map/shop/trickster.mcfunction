# ============================================================
# walls:map/shop/trickster
# Called by: walls:map/setup
# Executor:  Server, positioned where the villager should stand
#
# Macro args: {team:"main.it"}
#
# Sells the weird stuff. The spawners are team-stamped, so the mobs
# that come out of them never target the side that bought them.
# custom_spawn_rules is what lets them spawn in any light level.
# ============================================================

summon villager ~ ~ ~ {Tags:["walls.shop","walls.tmp"],Team:"walls.shop",CustomName:{text:"Trickster",color:"gray"},CustomNameVisible:1b,NoAI:1b,Silent:1b,Invulnerable:1b,PersistenceRequired:1b,VillagerData:{type:"minecraft:swamp",profession:"minecraft:cleric",level:5},Offers:{Recipes:[]}}

data modify entity @n[type=villager,tag=walls.tmp] Offers.Recipes append value {buy:{id:"minecraft:prismarine_crystals",count:6},sell:{id:"minecraft:ender_pearl",count:1},maxUses:9999,uses:0,rewardExp:false,xp:0,priceMultiplier:0.0f}
data modify entity @n[type=villager,tag=walls.tmp] Offers.Recipes append value {buy:{id:"minecraft:prismarine_crystals",count:8},sell:{id:"minecraft:spawner",count:1,components:{"minecraft:item_name":{text:"Cow Spawner",color:"green"},"minecraft:block_entity_data":{id:"minecraft:mob_spawner",SpawnData:{entity:{id:"minecraft:cow",Tags:["walls.mob"]},custom_spawn_rules:{block_light_limit:{min_inclusive:0,max_inclusive:15},sky_light_limit:{min_inclusive:0,max_inclusive:15}}},MinSpawnDelay:400,MaxSpawnDelay:800,SpawnCount:2,MaxNearbyEntities:6,RequiredPlayerRange:16,SpawnRange:4}}},maxUses:9999,uses:0,rewardExp:false,xp:0,priceMultiplier:0.0f}
$data modify entity @n[type=villager,tag=walls.tmp] Offers.Recipes append value {buy:{id:"minecraft:prismarine_crystals",count:16},sell:{id:"minecraft:spawner",count:1,components:{"minecraft:item_name":{text:"Zombie Spawner",color:"green"},"minecraft:block_entity_data":{id:"minecraft:mob_spawner",SpawnData:{entity:{id:"minecraft:zombie",Team:"$(team)",Tags:["walls.mob"],equipment:{head:{id:"minecraft:iron_helmet",count:1}},drop_chances:{head:0.0f}},custom_spawn_rules:{block_light_limit:{min_inclusive:0,max_inclusive:15},sky_light_limit:{min_inclusive:0,max_inclusive:15}}},MinSpawnDelay:200,MaxSpawnDelay:400,SpawnCount:2,MaxNearbyEntities:6,RequiredPlayerRange:16,SpawnRange:4}}},maxUses:9999,uses:0,rewardExp:false,xp:0,priceMultiplier:0.0f}
$data modify entity @n[type=villager,tag=walls.tmp] Offers.Recipes append value {buy:{id:"minecraft:prismarine_crystals",count:18},sell:{id:"minecraft:spawner",count:1,components:{"minecraft:item_name":{text:"Skeleton Spawner",color:"green"},"minecraft:block_entity_data":{id:"minecraft:mob_spawner",SpawnData:{entity:{id:"minecraft:skeleton",Team:"$(team)",Tags:["walls.mob"],equipment:{head:{id:"minecraft:iron_helmet",count:1}},drop_chances:{head:0.0f}},custom_spawn_rules:{block_light_limit:{min_inclusive:0,max_inclusive:15},sky_light_limit:{min_inclusive:0,max_inclusive:15}}},MinSpawnDelay:200,MaxSpawnDelay:400,SpawnCount:2,MaxNearbyEntities:6,RequiredPlayerRange:16,SpawnRange:4}}},maxUses:9999,uses:0,rewardExp:false,xp:0,priceMultiplier:0.0f}
data modify entity @n[type=villager,tag=walls.tmp] Offers.Recipes append value {buy:{id:"minecraft:prismarine_crystals",count:7},sell:{id:"minecraft:trident",count:1,components:{"minecraft:custom_data":{walls_boom:1b},"minecraft:item_name":{text:"Volatile Trident",color:"red"},"minecraft:lore":[{text:"Blows up wherever it lands",color:"gray",italic:false}]}},maxUses:9999,uses:0,rewardExp:false,xp:0,priceMultiplier:0.0f}
data modify entity @n[type=villager,tag=walls.tmp] Offers.Recipes append value {buy:{id:"minecraft:prismarine_crystals",count:13},sell:{id:"minecraft:golden_sword",count:1,components:{"minecraft:enchantments":{"minecraft:knockback":3}}},maxUses:9999,uses:0,rewardExp:false,xp:0,priceMultiplier:0.0f}
data modify entity @n[type=villager,tag=walls.tmp] Offers.Recipes append value {buy:{id:"minecraft:prismarine_crystals",count:7},sell:{id:"minecraft:paper",count:1,components:{"minecraft:custom_data":{walls_coupon:1b},"minecraft:rarity":"epic","minecraft:item_name":{text:"Insta-Respawn Coupon",color:"gold"},"minecraft:lore":[{text:"Consumed on death — respawn instantly",color:"gray",italic:false}]}},maxUses:9999,uses:0,rewardExp:false,xp:0,priceMultiplier:0.0f}

tag @n[type=villager,tag=walls.tmp] remove walls.tmp
