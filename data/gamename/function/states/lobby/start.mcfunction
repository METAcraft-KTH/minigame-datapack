# This function is called when the previous game has officially ended (game.id GLOBAL has switched to this game).
scoreboard players set ?state GAMENAME.game 0

# initialize timer
execute store result bossbar gamename:timer max run scoreboard players get time.lobby GAMENAME.config
scoreboard players set ?timer GAMENAME.game 0

scoreboard players reset @a GLOBAL.player_left

# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1
execute as @a[tag=!admin] run function gamename:states/lobby/reset_player

# reset all players' hunger, health, effects, xp
effect clear @a
effect give @a saturation 2 99 true
effect give @a instant_health 2 99 true
xp set @a 0
