scoreboard players add @s atc.fake_player_anger_timers 1
execute if score @s atc.fake_player_anger_timers matches 400.. run data remove entity @s Brain.memories."minecraft:angry_at"
execute if score @s atc.fake_player_anger_timers matches 400.. run scoreboard players reset @s atc.fake_player_anger_timers
