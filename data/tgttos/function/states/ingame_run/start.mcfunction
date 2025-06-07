# This function is called when the playable minigame actually begins.
scoreboard players set ?state tgttos.game 22

# various configs
function tgttos:states/pregame/configure_gamerule

# reduce timer
execute if score ?round.number tgttos.game matches 1 run scoreboard players set time.ingame_run tgttos.config 100
execute if score ?round.number tgttos.game matches 2 run scoreboard players set time.ingame_run tgttos.config 80
execute if score ?round.number tgttos.game matches 3 run scoreboard players set time.ingame_run tgttos.config 60
execute if score ?round.number tgttos.game matches 4..5 run scoreboard players set time.ingame_run tgttos.config 50
execute if score ?round.number tgttos.game matches 6..8 run scoreboard players set time.ingame_run tgttos.config 40
execute if score ?round.number tgttos.game matches 9.. run scoreboard players set time.ingame_run tgttos.config 30

# initialize timer
execute store result bossbar tgttos:timer max run scoreboard players get time.ingame_run tgttos.config
scoreboard players set ?timer tgttos.game 0

# tp everyone to the arena
#tp @a[tag=!admin] @n[tag=tgttos.tp.arena]

# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1
execute as @a[tag=!admin] run function tgttos:states/ingame_run/reset_player

title @a title {"text":"GET TO THE PORTAL!","color":"gold"}
execute at @n[tag=tgttos.tp.arena] run fill ~50 ~50 ~50 ~-50 ~-50 ~-50 air replace tinted_glass