execute as @a[team=atc.hiders] run function score:add_points {points:100}

execute store result score #hiders atc.game if entity @a[team=atc.hiders]
execute if score #hiders atc.game matches 0 run function atc:states/postgame/z/seeker_win
execute unless score #hiders atc.game matches 0 run function atc:states/postgame/z/hider_win

team leave @a
kill @e[tag=atc.fake_player]
effect give @a saturation 1 255 true
effect give @a instant_health 1 255 true
