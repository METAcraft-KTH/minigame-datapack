# This function is called when the playable minigame actually begins.
scoreboard players set ?state spleef.game 22

# reduce timer
execute if score ?round.number spleef.game matches 1 run scoreboard players set time.ingame_run spleef.config 60
execute if score ?round.number spleef.game matches 2 run scoreboard players set time.ingame_run spleef.config 40
execute if score ?round.number spleef.game matches 3..5 run scoreboard players set time.ingame_run spleef.config 30
execute if score ?round.number spleef.game matches 6..9 run scoreboard players set time.ingame_run spleef.config 25
execute if score ?round.number spleef.game matches 10.. run scoreboard players set time.ingame_run spleef.config 15

# initialize timer
scoreboard players set ?timer spleef.game 0

# keep color
execute if score ?colors spleef.game matches 3 store result score ?color.keep spleef.game run random value 1..3
execute if score ?colors spleef.game matches 4 store result score ?color.keep spleef.game run random value 1..4
execute if score ?colors spleef.game matches 5 store result score ?color.keep spleef.game run random value 1..5
execute if score ?colors spleef.game matches 6..7 store result score ?color.keep spleef.game run random value 1..6

# replace hand with block!!
clear @a[tag=!admin]
execute if score ?color.keep spleef.game matches 1 run item replace entity @a[tag=!admin] weapon.mainhand with gold_block[item_name="Stand on this block!!"]
execute if score ?color.keep spleef.game matches 2 run item replace entity @a[tag=!admin] weapon.mainhand with lapis_block[item_name="Stand on this block!!"]
execute if score ?color.keep spleef.game matches 3 run item replace entity @a[tag=!admin] weapon.mainhand with emerald_block[item_name="Stand on this block!!"]
execute if score ?color.keep spleef.game matches 4 run item replace entity @a[tag=!admin] weapon.mainhand with quartz_block[item_name="Stand on this block!!"]
execute if score ?color.keep spleef.game matches 5 run item replace entity @a[tag=!admin] weapon.mainhand with amethyst_block[item_name="Stand on this block!!"]
execute if score ?color.keep spleef.game matches 6 run item replace entity @a[tag=!admin] weapon.mainhand with redstone_block[item_name="Stand on this block!!"]

# bossbar!!
bossbar add spleef:timer ""
bossbar set spleef:timer players @a
bossbar set spleef:timer visible true
execute store result bossbar spleef:timer max run scoreboard players get time.ingame_run spleef.config
bossbar set spleef:timer value 0
execute if score ?color.keep spleef.game matches 1 run bossbar set spleef:timer color yellow
execute if score ?color.keep spleef.game matches 2 run bossbar set spleef:timer color blue
execute if score ?color.keep spleef.game matches 3 run bossbar set spleef:timer color green
execute if score ?color.keep spleef.game matches 4 run bossbar set spleef:timer color white
execute if score ?color.keep spleef.game matches 5 run bossbar set spleef:timer color pink
execute if score ?color.keep spleef.game matches 6 run bossbar set spleef:timer color red
execute if score ?color.keep spleef.game matches 1 run bossbar set spleef:timer name [{"text":"Stand on "},{"text":"gold","color":"yellow"},"!!"]
execute if score ?color.keep spleef.game matches 2 run bossbar set spleef:timer name [{"text":"Stand on "},{"text":"lapis","color":"blue"},"!!"]
execute if score ?color.keep spleef.game matches 3 run bossbar set spleef:timer name [{"text":"Stand on "},{"text":"emerald","color":"green"},"!!"]
execute if score ?color.keep spleef.game matches 4 run bossbar set spleef:timer name [{"text":"Stand on "},{"text":"quartz","color":"white"},"!!"]
execute if score ?color.keep spleef.game matches 5 run bossbar set spleef:timer name [{"text":"Stand on "},{"text":"amethyst","color":"light_purple"},"!!"]
execute if score ?color.keep spleef.game matches 6 run bossbar set spleef:timer name [{"text":"Stand on "},{"text":"redstone","color":"red"},"!!"]
# clear everyone's HUNGER!!
effect clear @a[tag=!admin] hunger

# fill offhand w wind charges!!
item replace entity @a[tag=!admin] weapon.offhand with wind_charge[use_remainder={id:"wind_charge"}]