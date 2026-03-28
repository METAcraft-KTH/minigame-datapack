scoreboard players operation ?world_border_size_100x uhc.state += ?world_border_dsize_dt_100x uhc.state
execute if score ?world_border_dsize_dt_100x uhc.state matches ..-1 if score ?world_border_size_100x uhc.state <= ?world_border_size_target_100x uhc.state run scoreboard players operation ?world_border_size_100x uhc.state = ?world_border_size_target_100x uhc.state
execute if score ?world_border_dsize_dt_100x uhc.state matches 1.. if score ?world_border_size_100x uhc.state >= ?world_border_size_target_100x uhc.state run scoreboard players operation ?world_border_size_100x uhc.state = ?world_border_size_target_100x uhc.state
execute if score ?world_border_dsize_dt_100x uhc.state matches ..-1 if score ?world_border_size_100x uhc.state <= ?world_border_size_target_100x uhc.state run scoreboard players set ?world_border_dsize_dt_100x uhc.state 0
execute if score ?world_border_dsize_dt_100x uhc.state matches 1.. if score ?world_border_size_100x uhc.state >= ?world_border_size_target_100x uhc.state run scoreboard players set ?world_border_dsize_dt_100x uhc.state 0
scoreboard players operation #world_border_lower_y uhc.temp = ?world_border_center_y_100x uhc.state
scoreboard players operation #world_border_lower_y uhc.temp -= ?world_border_size_100x uhc.state
scoreboard players operation #world_border_higher_y uhc.temp = ?world_border_center_y_100x uhc.state
scoreboard players operation #world_border_higher_y uhc.temp += ?world_border_size_100x uhc.state
execute as @e[tag=uhc.vertical_world_border_lower] at @s store result entity @s Pos[1] double 0.01 run scoreboard players get #world_border_lower_y uhc.temp
execute as @e[tag=uhc.vertical_world_border_higher] at @s store result entity @s Pos[1] double 0.01 run scoreboard players get #world_border_higher_y uhc.temp

# Check if players are under the lower vertical world border and damage them every second if they are
execute if score ?second_timer uhc.time matches 0 as @e[tag=uhc.vertical_world_border_lower] at @s positioned ~-1000 ~-2 ~-1000 as @a[dx=2000,dy=-1000,dz=2000] run function uhc:border/under_border
execute if score ?second_timer uhc.time matches 0 as @e[tag=uhc.vertical_world_border_higher] at @s positioned ~-1000 ~2 ~-1000 as @a[dx=2000,dy=-1000,dz=2000] run function uhc:border/over_border

