## Called when a player has qq.in_state undefined
scoreboard players set @s qq.in_state 1

# do respawn sequence
scoreboard players set @s qq.time_alive 0
xp set @s 0 levels
xp set @s 0 points
gamemode adventure @s