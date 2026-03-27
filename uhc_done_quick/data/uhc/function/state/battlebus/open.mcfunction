# Called when the battle bus opens its doors and the players
# can start jumping out. This is triggered by uhc:state/battlebus_tick.

scoreboard players set ?state uhc.state 1
execute as @n[tag=uhc.arena.battlebus] at @s if score @s uhc.arena = ?round uhc.state run place template uhc:battlebus_open ~-8 ~-1 ~-8
scoreboard players set @a uhc.flying 0
tag @a remove uhc.battlebus_sound_played

bossbar set uhc:bossbar visible true
bossbar set uhc:bossbar players @a
