# This function is called when the previous game has officially ended (game.id GLOBAL has switched to this game).
scoreboard players set ?state spleef.game 0

# initialize timer
execute store result bossbar spleef:timer max run scoreboard players get time.lobby spleef.config
scoreboard players set ?timer spleef.game 0

scoreboard players reset @a GLOBAL.player_left

# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1
execute as @a[tag=!admin] run function spleef:states/lobby/reset_player

# reset all players' hunger, health, effects, xp, inventory
effect clear @a[tag=!admin]
effect give @a[tag=!admin] saturation 2 99 true
effect give @a[tag=!admin] instant_health 2 99 true
xp set @a[tag=!admin] 0 levels
xp set @a[tag=!admin] 0 points
clear @a[tag=!admin]