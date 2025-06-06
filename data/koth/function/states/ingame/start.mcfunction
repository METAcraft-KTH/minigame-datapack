# This function is called when the playable minigame actually begins.
scoreboard players set ?state koth.game 2

# various configs
function koth:states/pregame/configure_gamerule

# initialize timer
execute store result bossbar koth:timer max run scoreboard players get time.ingame koth.config
scoreboard players set ?timer koth.game 0

# Assign teams
pointsystem join-scoreboard-teams-balanced @a[tag=!admin] koth.blue koth.red

# tp everyone to the arena
tp @a[tag=!admin,team=koth.blue] @n[tag=koth.tp.blue]
tp @a[tag=!admin,team=koth.red] @n[tag=koth.tp.red]

# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1
execute as @a[tag=!admin] run function koth:states/ingame/reset_player