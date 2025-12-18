execute as @e[tag=atc.fake_player_spawn_center] at @s run function atc:utility/spawn_fake_player
execute if score fake_player_radius atc.config matches 1.. at @e[tag=atc.fake_player_spawn_center] as @n[tag=atc.fake_player] run function atc:states/pregame/z/spread_player
scoreboard players add #fake_player_count atc.game 1
execute if score #fake_player_count atc.game <= fake_player_count atc.config run schedule function atc:states/pregame/z/spawn_next_fake_player 1t replace
