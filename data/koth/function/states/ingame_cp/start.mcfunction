# This function is called when the playable minigame actually begins.
scoreboard players operation ?state koth.game = state.ingame_cp koth.config

# various configs
function koth:states/pregame/configure_gamerule

# initialize timer
execute store result bossbar koth:timer max run scoreboard players get time.ingame_cp koth.config
scoreboard players set ?timer koth.game 0

# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1
execute as @a[tag=!admin] run function koth:states/ingame_cp/reset_player

scoreboard players set @e[tag=koth.cp] koth.cp 0
execute as @e[tag=koth.cp] at @s run fill ~-5 ~ ~-5 ~5 ~ ~5 light_gray_wool replace #wool
execute as @e[tag=koth.cp] at @s run fill ~ ~ ~ ~ ~ ~ light_gray_stained_glass
scoreboard players set blue koth.game 0
scoreboard players set red koth.game 0

scoreboard players reset * koth.display
