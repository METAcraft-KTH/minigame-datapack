scoreboard players add @s atc.fake_player_anger_timers 1
execute on target run effect give @s blindness 2 0 true
execute on target run effect give @s weakness 1 255 true

execute if score @s atc.fake_player_anger_timers >= fake_player_anger_time atc.config run data remove entity @s Brain.memories."minecraft:angry_at"
execute if score @s atc.fake_player_anger_timers >= fake_player_anger_time atc.config run scoreboard players reset @s atc.fake_player_anger_timers
