tag @s add atc.fake_player_copied_to
tag @r add atc.copying_from_player
data modify storage atc:temp skin_data set from entity @p[tag=atc.copying_from_player,limit=1] "fabrictailor:skin_data"
execute if data storage atc:temp skin_data run data modify entity @s profile.properties[0] merge from storage atc:temp skin_data
execute unless data storage atc:temp skin_data run function atc:utility/z/set_skin_from_uuid
data remove storage atc:temp skin_data
execute as @a[tag=atc.copying_from_player,limit=1] run function atc:utility/z/create_temp_head {command: "data modify entity @n[tag=atc.fake_player_copied_to] CustomName set from entity @s item.components.minecraft:profile.name"}
tag @s remove atc.fake_player_copied_to
tag @a remove atc.copying_from_player
