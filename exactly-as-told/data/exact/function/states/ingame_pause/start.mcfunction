# This function is called when the playable minigame actually begins.
scoreboard players set ?state exact.game 23

# various configs
function exact:states/pregame/configure_gamerule

# initialize timer
execute store result bossbar exact:timer max run scoreboard players get time.ingame_pause exact.config
scoreboard players set ?timer exact.game 0

# tp everyone to the arena
#tp @a[tag=!admin] @n[tag=exact.tp.arena]

# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1
execute as @a[tag=!admin] run function exact:states/ingame_pause/reset_player

# clear everyone's items!!
clear @a[tag=!admin]
title @a times 0 80 20
title @a[tag=!exact.done,tag=!admin] title {"text":"FAILED","color":"red",bold:true}

# kill mobs
execute at @n[tag=exact.tp.arena,type=marker] as @e[type=!player,type=!marker,distance=..100] at @s run tp @s ~ ~-100 ~

fill 10054 89 326 10068 89 312 iron_block
execute if score ?round.number exact.game matches 4 run fill 10054 90 326 10068 93 312 air replace
execute if score ?round.number exact.game matches 5 run tp @a[tag=!admin] @n[type=marker,tag=exact.tp.arena]
execute if score ?round.number exact.game matches 6 run tp @a[tag=!admin] @n[type=marker,tag=exact.tp.arena]
execute if score ?round.number exact.game matches 7 at @n[type=marker,tag=exact.tp.arena] run fill ~2 ~18 ~2 ~-2 ~18 ~-2 air
execute if score ?round.number exact.game matches 9 run time set noon
execute if score ?round.number exact.game matches 9 at @n[type=marker,tag=exact.tp.arena] run fill ~30 ~3 ~30 ~-30 ~-2 ~-30 air replace #beds
execute if score ?round.number exact.game matches 11 run team leave @a[team=exact.temp]
execute if score ?round.number exact.game matches 14 at @n[type=marker,tag=exact.tp.arena] run tp @a[tag=!admin,distance=..100] ~ ~ ~
#execute if score ?round.number exact.game matches 1 run fill 10080 93 300 10043 89 337 white_concrete_powder replace lapis_ore
#execute if score ?round.number exact.game matches 3 run fill 10080 93 300 10043 89 337 white_concrete_powder replace diamond_ore
#execute if score ?round.number exact.game matches 10 run fill 10080 93 300 10043 89 337 white_concrete_powder replace crafting_table


# if its the last round, just end game immediately
execute if score ?round.number exact.game matches 15 run return run function exact:states/postgame/start