# This function is called when the playable minigame actually begins.
scoreboard players set ?state koth.game 3

# various configs
function koth:states/pregame/configure_gamerule

# initialize timer
execute store result bossbar koth:timer max run scoreboard players get time.ingame_walldrop koth.config
scoreboard players set ?timer koth.game 0

# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1
execute as @a[tag=!admin] run function koth:states/ingame_walldrop/reset_player

scoreboard players set @e[tag=koth.cp] koth.cp 0
execute as @e[tag=koth.cp] at @s run fill ~-5 ~ ~-5 ~5 ~ ~5 light_gray_wool replace #wool
execute as @e[tag=koth.cp] at @s run fill ~ ~ ~ ~ ~ ~ light_gray_stained_glass

function koth:wall/remove_wall

scoreboard players reset * koth.display
scoreboard players set line1 koth.display 1
scoreboard players display name line1 koth.display {"text": "Wall dropped!","color":"aqua","italic":true}