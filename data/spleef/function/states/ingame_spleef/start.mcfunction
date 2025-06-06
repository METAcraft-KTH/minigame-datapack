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
title @a times 0 40 20
title @a title {"text":"SPLEEF!!","bold":true,"color":"gold"}
title @a subtitle ""

# give everyone pickaxes!!
give @a[tag=!admin] golden_pickaxe[enchantments={efficiency:100},tooltip_display={hidden_components:["enchantments","can_break"]},can_break={blocks:["red_terracotta","orange_terracotta","yellow_terracotta","black_terracotta","purple_terracotta","blue_terracotta","green_terracotta"]},unbreakable={},item_name="Mine blocks to restore hunger"]
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
execute if score ?round.number spleef.game matches 2 run title @a subtitle "btw, spleef to restore hunger"
execute if score ?round.number spleef.game matches 2 run title @a actionbar "🎵 BadApple!! (noteblock arr. Akitsuki4852)"

execute if score ?round.number spleef.game matches 3 run title @a subtitle "Bomberman Edition"
execute if score ?round.number spleef.game matches 3 run give @a[tag=!admin] experience_bottle[item_model="tnt",item_name="Throwable TNT"] 5

execute if score ?round.number spleef.game matches 4 run title @a subtitle "sumo tendencies"
execute if score ?round.number spleef.game matches 4..7 run give @a[tag=!admin] bow[enchantments={infinity:1,punch:1},unbreakable={},item_name="This bow does not break blocks"]
execute if score ?round.number spleef.game matches 4 run give @a[tag=!admin] stick[item_model="cod",item_name="Daskefisk",enchantments={knockback:1}] 1

execute if score ?round.number spleef.game matches 5 run title @a subtitle "CHICKEN JOCKEY!!!"
execute if score ?round.number spleef.game matches 5 as @a[tag=!admin,gamemode=adventure] at @s run summon chicken ~ 32 ~ {Invulnerable:1b,Passengers:[{id:"zombie",Invulnerable:1b,IsBaby:true,equipment:{mainhand:{id:"golden_pickaxe",components:{enchantments:{knockback:3}}}}}],IsChickenJockey:true,active_effects:[{id:"speed",amplifier:5,duration:-1,show_particles:false}]}

execute if score ?round.number spleef.game matches 6 run title @a subtitle "baby man edition"
execute if score ?round.number spleef.game matches 6 as @a[tag=!admin] run attribute @s scale modifier add spleef:babyman -0.5 add_multiplied_base

execute if score ?round.number spleef.game matches 7 run title @a subtitle "this might be tnt run"

execute if score ?round.number spleef.game matches 8 run title @a subtitle "No pickaxe. Figure it out"
execute if score ?round.number spleef.game matches 8 run clear @a[tag=!admin] golden_pickaxe
execute if score ?round.number spleef.game matches 8.. run give @a[tag=!admin] bow[enchantments={infinity:1,punch:1},unbreakable={},item_name="This bow DOES break blocks"]
execute if score ?round.number spleef.game matches 8.. run give @a[tag=!admin] experience_bottle[item_model="tnt",item_name="Throwable TNT"] 3
execute if score ?round.number spleef.game matches 8 run item replace entity @a[tag=!admin] inventory.1 with golden_pickaxe[can_break={blocks:["red_terracotta","orange_terracotta","yellow_terracotta","black_terracotta","purple_terracotta","blue_terracotta","green_terracotta"]},unbreakable={},item_name="I can eat blocks, it does not hurt me",item_model="white_stained_glass_pane",enchantments={knockback:1,efficiency:3}]
execute if score ?round.number spleef.game matches 8 run effect clear @a[tag=!admin] hunger

execute if score ?round.number spleef.game matches 9 run title @a subtitle "BIG man edition"
execute if score ?round.number spleef.game matches 9 as @a[tag=!admin] run attribute @s scale modifier add spleef:bigman 0.5 add_multiplied_base

execute if score ?round.number spleef.game matches 10 run title @a subtitle "oops! all darkness"

execute if score ?round.number spleef.game matches 11 run title @a subtitle "whatever, random bs go"
execute if score ?round.number spleef.game matches 11 run give @a[tag=!admin] experience_bottle[item_model="tnt",item_name="Throwable TNT"] 10
execute if score ?round.number spleef.game matches 11 run give @a[tag=!admin] stick[item_model="cod",item_name="Daskefisk",enchantments={knockback:1}] 1
execute if score ?round.number spleef.game matches 11 as @a[tag=!admin,gamemode=adventure] at @s run summon chicken ~ 32 ~ {Invulnerable:1b,Passengers:[{id:"zombie",Invulnerable:1b,IsBaby:true,equipment:{mainhand:{id:"golden_pickaxe",components:{enchantments:{knockback:3}}}}}],IsChickenJockey:true,active_effects:[{id:"speed",amplifier:5,duration:-1,show_particles:false}]}

execute if score ?round.number spleef.game matches 12 run title @a subtitle "something might happen..."
execute if score ?round.number spleef.game matches 13 run title @a subtitle "ok last round i swear"

execute if score ?round.number spleef.game matches 4.. run give @a[tag=!admin] arrow

# play music
execute as @a at @s run function spleefmusic:badapple/play