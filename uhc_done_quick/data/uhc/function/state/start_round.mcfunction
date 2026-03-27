# ?round uhc.state must be set before this function is called.

scoreboard players set ?timer uhc.time 0
scoreboard players set ?state uhc.state 0
# teleport everyone to arena with uhc.arena score matching ?round uhc.state
execute as @n[tag=uhc.arena.battlebus] at @s if score @s uhc.arena = ?round uhc.state run tp @a @s
execute as @n[tag=uhc.arena.battlebus] at @s if score @s uhc.arena = ?round uhc.state run place structure uhc:battlebus ~ ~ ~

# Reset and setup players
execute as @a[tag=!admin] at @s run function uhc:util/setup_player