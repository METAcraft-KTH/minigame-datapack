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

# keep color
execute if score ?colors tgttos.game matches 3 store result score ?color.keep tgttos.game run random value 1..3
execute if score ?colors tgttos.game matches 4 store result score ?color.keep tgttos.game run random value 1..4
execute if score ?colors tgttos.game matches 5 store result score ?color.keep tgttos.game run random value 1..5
execute if score ?colors tgttos.game matches 6 store result score ?color.keep tgttos.game run random value 1..6

# replace hand with block!!
clear @a[tag=!admin]
execute if score ?color.keep tgttos.game matches 1 run item replace entity @a[tag=!admin] weapon.mainhand with red_terracotta[item_name="Stand on this block!!"]
execute if score ?color.keep tgttos.game matches 2 run item replace entity @a[tag=!admin] weapon.mainhand with yellow_terracotta[item_name="Stand on this block!!"]
execute if score ?color.keep tgttos.game matches 3 run item replace entity @a[tag=!admin] weapon.mainhand with orange_terracotta[item_name="Stand on this block!!"]
execute if score ?color.keep tgttos.game matches 4 run item replace entity @a[tag=!admin] weapon.mainhand with purple_terracotta[item_name="Stand on this block!!"]
execute if score ?color.keep tgttos.game matches 5 run item replace entity @a[tag=!admin] weapon.mainhand with green_terracotta[item_name="Stand on this block!!"]
execute if score ?color.keep tgttos.game matches 6 run item replace entity @a[tag=!admin] weapon.mainhand with blue_terracotta[item_name="Stand on this block!!"]

# clear everyone's HUNGER!!
effect clear @a[tag=!admin] hunger

# fill offhand w wind charges!!
item replace entity @a[tag=!admin] weapon.offhand with wind_charge[use_remainder={id:"wind_charge"}]