# Called every tick while the game is in the playing state.

# Increment time
scoreboard players add ?timer uhc.time 1
scoreboard players operation ?second_timer uhc.time = ?timer uhc.time
scoreboard players set #20 uhc.temp 20
scoreboard players operation ?second_timer uhc.time %= #20 uhc.temp
scoreboard players set #1200 uhc.temp 1200
scoreboard players operation ?minute_timer uhc.time = ?timer uhc.time
scoreboard players operation ?minute_timer uhc.time %= #1200 uhc.temp

# Enchantments
enchant @a[gamemode=survival] efficiency 5
enchant @a[gamemode=survival] fortune 3
# this doesn't do anything but it communicates to the players that autosmelt is active.
#enchant @a[gamemode=survival] uhc:autosmelt

# When players land, remove elytra and change gamemode
execute as @a[tag=uhc.not_landed] at @s unless block ~ ~-1 ~ air unless block ~ ~-2 ~ air run function uhc:state/playing/landed

# Battlebus weeeeoooo sound
execute if score ?timer uhc.time < ?sound_stop_time uhc.time as @e[tag=uhc.arena.battlebus] at @s if score @s uhc.arena = ?round uhc.state as @a[distance=25..,tag=!uhc.battlebus_sound_played,scores={uhc.flying=500..}] run function uhc:state/playing/battlebus_sound

# Call the appropriate tick function based on the current timer value.
execute if score ?timer uhc.time <= ?grace_period_time uhc.time run function uhc:state/playing/tick_grace_period
execute unless score ?timer uhc.time <= ?grace_period_time uhc.time if score ?timer uhc.time <= ?worldborder_vertical_shrink_time uhc.time run function uhc:state/playing/tick_waiting_for_vertical
execute unless score ?timer uhc.time <= ?worldborder_vertical_shrink_time uhc.time if score ?timer uhc.time <= ?wither_spawn_time uhc.time run function uhc:state/playing/tick_waiting_for_wither

# Ensure pvp is enabled after the grace period ends, in case something goes wrong with the grace_period_end function.
execute if score ?timer uhc.time > ?grace_period_time uhc.time as @a[team=uhc.grace_period] run team remove uhc.grace_period

# Trigger world border shrink at the right time
execute if score ?timer uhc.time = ?worldborder_horizontal_shrink_time uhc.time run function uhc:state/playing/world_border_horiztonal_start

# Tick the vertical world border
function uhc:border/border_tick

# Count number of players alive
scoreboard players set ?alive uhc.state 0
execute as @a[gamemode=survival] run scoreboard players add ?alive uhc.state 1
execute as @a[gamemode=adventure] run scoreboard players add ?alive uhc.state 1

# Players alive
execute unless score ?alive_prev uhc.state = ?alive uhc.state run function uhc:state/playing/players_alive_change

execute if score ?minute_timer uhc.time matches 1000 as @a[gamemode=survival] run function score:add_points {points:10}
execute if score ?minute_timer uhc.time matches 1000 run tellraw @a[gamemode=survival] ["",{"text":"+10💎 for being alive for another minute!"}]
