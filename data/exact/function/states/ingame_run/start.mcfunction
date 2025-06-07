# This function is called when the playable minigame actually begins.
scoreboard players set ?state exact.game 22

# initialize timer
execute store result bossbar exact:timer max run scoreboard players get time.ingame_run exact.config
scoreboard players set ?timer exact.game 0

# tp everyone to the arena
#tp @a[tag=!admin] @n[tag=exact.tp.arena]

# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1
execute as @a[tag=!admin] run function exact:states/ingame_run/reset_player

title @a title {"text":"GET TO THE PORTAL!","color":"gold"}
execute at @n[tag=exact.tp.arena] run fill ~30 ~-1 ~30 ~-30 ~3 ~-30 structure_void replace tinted_glass
execute at @n[tag=exact.tp.arena] run fill ~30 ~4 ~30 ~-30 ~6 ~-30 structure_void replace tinted_glass
execute at @n[tag=exact.tp.arena] run fill ~30 ~7 ~30 ~-30 ~9 ~-30 structure_void replace tinted_glass
execute at @n[tag=exact.tp.arena] run fill ~30 ~9 ~30 ~-30 ~12 ~-30 structure_void replace tinted_glass