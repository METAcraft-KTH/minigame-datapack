# This function is called when the playable minigame actually begins.
scoreboard players set ?state spleef.game 21

# initialize timer
scoreboard players set ?timer spleef.game 0
# set the target time to a random interval to keep you on your toes
execute store result score time.ingame_spleef spleef.config run random value 300..800

# tp everyone to the arena
#tp @a[tag=!admin] @n[tag=spleef.tp.arena]

# respawn everyone in spectator
tp @a[gamemode=spectator,tag=!admin] 30024 50 50024
execute as @a[gamemode=spectator,tag=!admin] run gamemode adventure

# add round number
scoreboard players add ?round.number spleef.game 1

# title
title @a times 0 40 20
title @a title {"text":"SPLEEF!!","bold":true,"color":"gold"}
title @a subtitle ""

# give everyone pickaxes!!
give @a[tag=!admin] golden_pickaxe[enchantments={efficiency:100},tooltip_display={hidden_components:["enchantments","can_break"]},can_break={},unbreakable={},item_name="Mine blocks to restore hunger"]
# fill offhand w wind charges!!
item replace entity @a[tag=!admin] weapon.offhand with wind_charge 3

# give everyone HUNGER!!
effect give @a[tag=!admin] hunger infinite 60 true

# place blocks!!
execute if score ?round.number spleef.game matches 3 run scoreboard players set ?colors spleef.game 4
execute if score ?round.number spleef.game matches 5 run scoreboard players set ?colors spleef.game 5
execute if score ?round.number spleef.game matches 7 run scoreboard players set ?colors spleef.game 6
execute if score ?round.number spleef.game matches 9 run scoreboard players set ?colors spleef.game 7
function spleef:utility/map/place

# start from round 8, give bows
execute if score ?round.number spleef.game matches 8.. run give @a[tag=!admin] bow[enchantments={punch:1,infinity:1},unbreakable={}]
execute if score ?round.number spleef.game matches 8.. run give @a[tag=!admin] arrow

# play music
execute as @a at @s run function spleefmusic:sans/play