execute store result score #random_result atc.game run random value 0..100
execute if score #random_result atc.game matches 0..99 run function atc:utility/z/init_ingame_player
execute if score #random_result atc.game matches 100 run function atc:utility/z/init_remote_player
data merge entity @s {PersistenceRequired:1b}
team join atc.hiders @s
tag @s add atc.fake_player
effect give @s resistance infinite 5 true
