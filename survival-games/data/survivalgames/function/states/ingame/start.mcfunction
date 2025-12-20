# This function is called when the playable minigame actually begins.
scoreboard players operation ?state SURVIVALGAMES.game = state.ingame SURVIVALGAMES.config

# various configs
function survivalgames:states/pregame/configure_gamerule

# initialize timer
execute store result bossbar survivalgames:timer max run scoreboard players get time.ingame SURVIVALGAMES.config
scoreboard players set ?timer SURVIVALGAMES.game 0


# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players operation @a GLOBAL.player_in_state = id SURVIVALGAMES.config
execute as @a[tag=!admin] run function survivalgames:states/ingame/reset_player


scoreboard players operation @a[tag=!admin] SURVIVALGAMES.player_round = round SURVIVALGAMES.game


#set-block-break-rules {blocks: [{blocks: ["fire", "soul_fire"]}], allow_mode: true}

gamemode adventure @a[tag=!admin]
effect give @a resistance 30 255 true