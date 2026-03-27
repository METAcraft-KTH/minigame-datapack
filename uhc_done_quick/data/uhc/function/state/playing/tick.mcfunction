# Called every tick while the game is in the playing state.

scoreboard players add ?timer uhc.time 1
enchant @a[gamemode=survival] efficiency 5
enchant @a[gamemode=survival] fortune 3
# this doesn't do anything but it communicates to the players that autosmelt is active.
enchant @a[gamemode=survival] uhc:autosmelt

execute as @a[tag=uhc.not_landed] at @s unless block ~ ~-1 ~ air unless block ~ ~-2 ~ air run function uhc:state/playing/landed

execute if score ?timer uhc.time < ?sound_stop_time uhc.time as @e[tag=uhc.arena.battlebus] at @s if score @s uhc.arena = ?round uhc.state as @a[distance=25..,tag=!uhc.battlebus_sound_played,scores={uhc.flying=500..}] run function uhc:state/playing/battlebus_sound
