# This function is called when the previous game has officially ended (game.id GLOBAL has switched to this game).
scoreboard players set ?state qq.game 0

# new state, reset GLOBAL.player_in_state
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1

# initialize timer
execute store result bossbar qq:timer max run scoreboard players get time.lobby qq.config
scoreboard players set ?timer qq.game 0

# Reset here because it havent been reset while mode disabled
scoreboard players reset @a GLOBAL.player_left

# Reset mode
scoreboard players set mode qq.config 0

## put everyone on a team
team add qq.players "Players"
team modify qq.players nametagVisibility hideForOwnTeam
team modify qq.players seeFriendlyInvisibles false
team modify qq.players friendlyFire false
team join qq.players @a[tag=!admin]

# reset all players' hunger, health, effects, xp, inventory
gamemode adventure @a[tag=!admin]
effect clear @a[tag=!admin]
effect give @a[tag=!admin] saturation 2 99 true
effect give @a[tag=!admin] instant_health 2 99 true
xp set @a[tag=!admin] 0
clear @a[tag=!admin]