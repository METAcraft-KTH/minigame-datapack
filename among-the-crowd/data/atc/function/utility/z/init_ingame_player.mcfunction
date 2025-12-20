tag @s add atc.fake_player_copied_to
tag @r add atc.copying_from_player
player-mob copy-skin-to @s @p[tag=atc.copying_from_player,limit=1]
execute as @a[tag=atc.copying_from_player,limit=1] run function atc:utility/z/create_temp_head {command: "data modify entity @n[tag=atc.fake_player_copied_to] CustomName set from entity @s item.components.minecraft:profile.name"}
tag @s remove atc.fake_player_copied_to
tag @a remove atc.copying_from_player
