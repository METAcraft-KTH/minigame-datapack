## Called when a player has GLOBAL.player_in_state undefined
scoreboard players set @s GLOBAL.player_in_state 1

# do respawn sequence
scoreboard players set @s GLOBAL.time_alive 0
xp set @s 0 levels
xp set @s 0 points
gamemode adventure @s