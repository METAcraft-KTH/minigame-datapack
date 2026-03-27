# This function is called when the playable minigame actually begins.
scoreboard players set ?state spleef.game 22

# various configs
function spleef:states/pregame/configure_gamerule

# reduce timer
execute if score ?round.number spleef.game matches 1 run scoreboard players set time.ingame_run spleef.config 100
execute if score ?round.number spleef.game matches 2 run scoreboard players set time.ingame_run spleef.config 80
execute if score ?round.number spleef.game matches 3 run scoreboard players set time.ingame_run spleef.config 60
execute if score ?round.number spleef.game matches 4..5 run scoreboard players set time.ingame_run spleef.config 50
execute if score ?round.number spleef.game matches 6..8 run scoreboard players set time.ingame_run spleef.config 40
execute if score ?round.number spleef.game matches 9.. run scoreboard players set time.ingame_run spleef.config 30

# initialize timer
scoreboard players set ?timer spleef.game 0

# tp everyone to the arena
#tp @a[tag=!admin] @n[tag=spleef.tp.arena]

# blow up people who have tnt
execute at @a[scores={spleef.hastnt=1..}] run summon tnt ~ ~ ~ {fuse:1}
kill @a[scores={spleef.hastnt=1..}]
tellraw @a[scores={spleef.hastnt=1..}] {"text":"You exploded because you didn't give away your TNT in time!","color":"red"}

execute as @a[tag=!admin] run function spleef:states/ingame_run/reset_player

# keep color
execute if score ?colors spleef.game matches 3 store result score ?color.keep spleef.game run random value 1..3
execute if score ?colors spleef.game matches 4 store result score ?color.keep spleef.game run random value 1..4
execute if score ?colors spleef.game matches 5 store result score ?color.keep spleef.game run random value 1..5
execute if score ?colors spleef.game matches 6 store result score ?color.keep spleef.game run random value 1..6

# replace hand with block!!
clear @a[tag=!admin]
execute if score ?color.keep spleef.game matches 1 run item replace entity @a[tag=!admin] weapon.mainhand with red_terracotta[item_name="Stand on this block!!"]
execute if score ?color.keep spleef.game matches 2 run item replace entity @a[tag=!admin] weapon.mainhand with yellow_terracotta[item_name="Stand on this block!!"]
execute if score ?color.keep spleef.game matches 3 run item replace entity @a[tag=!admin] weapon.mainhand with orange_terracotta[item_name="Stand on this block!!"]
execute if score ?color.keep spleef.game matches 4 run item replace entity @a[tag=!admin] weapon.mainhand with purple_terracotta[item_name="Stand on this block!!"]
execute if score ?color.keep spleef.game matches 5 run item replace entity @a[tag=!admin] weapon.mainhand with green_terracotta[item_name="Stand on this block!!"]
execute if score ?color.keep spleef.game matches 6 run item replace entity @a[tag=!admin] weapon.mainhand with blue_terracotta[item_name="Stand on this block!!"]

# clear everyone's HUNGER!!
effect clear @a[tag=!admin] hunger

# fill offhand w wind charges!!
item replace entity @a[tag=!admin] weapon.offhand with wind_charge[use_remainder={id:"wind_charge"}]