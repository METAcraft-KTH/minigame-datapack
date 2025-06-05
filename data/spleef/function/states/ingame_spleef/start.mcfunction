# This function is called when the playable minigame actually begins.
scoreboard players set ?state spleef.game 21

# various configs
function spleef:states/pregame/configure_gamerule

# initialize timer
execute store result bossbar spleef:timer max run scoreboard players get time.ingame_spleef spleef.config
scoreboard players set ?timer spleef.game 0

# tp everyone to the arena
#tp @a[tag=!admin] @n[tag=spleef.tp.arena]

# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1
execute as @a[tag=!admin] run function spleef:states/ingame_spleef/reset_player

# respawn everyone in spectator
tp @a[gamemode=spectator,tag=!admin] @n[tag=spleef.tp.arena,type=marker]
execute as @a[gamemode=spectator,tag=!admin] run gamemode adventure


# add round number
scoreboard players add ?round.number spleef.game 1

# title
title @a times 0 20 20
title @a title {"text":"SPLEEF!!","bold":true}

# give everyone pickaxes!!
give @a[tag=!admin] golden_pickaxe[enchantments={efficiency:100},tooltip_display={hidden_components:["enchantments","can_break"]},can_break={blocks:["red_terracotta","orange_terracotta","yellow_terracotta","black_terracotta","purple_terracotta","blue_terracotta","green_terracotta"]},unbreakable={}]
# fill offhand w wind charges!!
item replace entity @a[tag=!admin] weapon.offhand with wind_charge[use_remainder={id:"wind_charge"}]

# give everyone HUNGER!!
effect give @a[tag=!admin] hunger infinite 60 true

# place blocks!!
execute if score ?round.number spleef.game matches 3 run scoreboard players set ?colors spleef.game 4
execute if score ?round.number spleef.game matches 6 run scoreboard players set ?colors spleef.game 5
execute if score ?round.number spleef.game matches 9 run scoreboard players set ?colors spleef.game 6
function spleef:utility/game/blocks/place/run

# ""random"" event
execute if score ?round.number spleef.game matches 3 run scoreboard players set ?colors spleef.game 4