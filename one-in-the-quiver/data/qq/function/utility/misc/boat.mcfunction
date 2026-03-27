execute store result score .rand var run random value 1..9

execute if score .rand var matches 1 run summon acacia_boat ~5 ~ ~5 {Tags:["EasterEggBoat","this"]}
execute if score .rand var matches 2 run summon bamboo_raft ~5 ~ ~5 {Tags:["EasterEggBoat","this"]}
execute if score .rand var matches 3 run summon birch_boat ~5 ~ ~5 {Tags:["EasterEggBoat","this"]}
execute if score .rand var matches 4 run summon dark_oak_boat ~5 ~ ~5 {Tags:["EasterEggBoat","this"]}
execute if score .rand var matches 5 run summon jungle_boat ~5 ~ ~5 {Tags:["EasterEggBoat","this"]}
execute if score .rand var matches 6 run summon mangrove_boat ~5 ~ ~5 {Tags:["EasterEggBoat","this"]}
execute if score .rand var matches 7 run summon oak_boat ~5 ~ ~5 {Tags:["EasterEggBoat","this"]}
execute if score .rand var matches 8 run summon spruce_boat ~5 ~ ~5 {Tags:["EasterEggBoat","this"]}
execute if score .rand var matches 9 run summon cherry_boat ~5 ~ ~5 {Tags:["EasterEggBoat","this"]}

ride @s mount @n[tag=this]

tag @e[tag=this] remove this