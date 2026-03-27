# Called when the battle bus opens its doors and the players
# can start jumping out. This is triggered by uhc:state/battlebus_tick.

scoreboard players set ?state uhc.state 1
execute as @n[tag=uhc.arena.battlebus] at @s if score @s uhc.arena = ?round uhc.state run place structure uhc:battlebus_open ~ ~ ~
