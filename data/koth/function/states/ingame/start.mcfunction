# This function is called when the playable minigame actually begins.
scoreboard players operation ?state koth.game = state.ingame koth.config

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
gamemode survival @a[tag=!admin]
execute at @n[tag=koth.tp.blue] run spawnpoint @s[team=koth.blue] ~ ~ ~ 0
execute at @n[tag=koth.tp.red] run spawnpoint @s[team=koth.red] ~ ~ ~ 0

# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1
execute as @a[tag=!admin] run function koth:states/ingame/reset_player

scoreboard players set @e[tag=koth.cp] koth.cp 0
execute as @e[tag=koth.cp] at @s run fill ~-5 ~ ~-5 ~5 ~ ~5 light_gray_wool replace #wool
execute as @e[tag=koth.cp] at @s run fill ~ ~ ~ ~ ~ ~ light_gray_stained_glass

function koth:wall/make_wall

scoreboard players reset * koth.display
scoreboard players set line1 koth.display 1
scoreboard players display name line1 koth.display {"text": "Gather gear!","color":"aqua","italic":true}

scoreboard objectives setdisplay sidebar koth.display