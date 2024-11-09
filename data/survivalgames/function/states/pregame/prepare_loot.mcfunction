data remove block ~ ~ ~ Items
execute if block ~ ~ ~ chest run data merge block ~ ~ ~ {LootTable: "survivalgames:loot_chest"}
execute unless block ~ ~ ~ chest run data merge block ~ ~ ~ {LootTable: "survivalgames:loot_chest_bonus"}
