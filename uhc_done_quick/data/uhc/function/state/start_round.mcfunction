# ?round uhc.state must be set before this function is called.

scoreboard players set ?timer uhc.time 0
scoreboard players set ?state uhc.state 0
scoreboard players set ?world_border_y_100x uhc.state -6400
scoreboard players set ?world_border_dy_dt_100x uhc.state 0
scoreboard players set ?world_border_y_target_100x uhc.state -6400
# teleport everyone to arena with uhc.arena score matching ?round uhc.state
execute as @n[tag=uhc.arena.battlebus] at @s if score @s uhc.arena = ?round uhc.state run function uhc:state/start_round_at_arena

# Reset and setup players
execute as @a[tag=!admin] at @s run function uhc:util/setup_player