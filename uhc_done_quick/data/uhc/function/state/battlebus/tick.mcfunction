# Called each tick when this minigame is active and in ?state uhc.state 0 (the battle bus state).

scoreboard players add ?timer uhc.time 1

execute if score ?timer uhc.time >= ?battlebus_wait_time uhc.time run function uhc:state/battlebus/open

execute if score ?timer uhc.time matches 20 at @e[tag=uhc.arena.battlebus] run playsound uhc:fortnite_battle_bus_horn master @a ~ ~ ~
