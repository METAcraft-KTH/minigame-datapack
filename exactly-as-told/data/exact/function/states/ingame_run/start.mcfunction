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

# reset spawn point
execute at @n[type=marker,tag=exact.tp.arena] run spawnpoint @a[tag=!admin] ~ ~ ~ ~ ~

scoreboard players add ?round.number exact.game 1


tellraw @a [{"text":"ROUND ","color":"gold",bold:true},{score:{name:"?round.number",objective:"exact.game"}}]



execute if score ?round.number exact.game matches 1 run item replace entity @a[tag=!admin] weapon.mainhand with diamond_spear[enchantments={lunge:3}]

execute if score ?round.number exact.game matches 2 run gamerule block_drops true
execute if score ?round.number exact.game matches 2 at @n[type=marker,tag=exact.tp.arena] run summon wandering_trader ~ ~ ~
execute if score ?round.number exact.game matches 2 at @n[type=marker,tag=exact.tp.arena] run summon wandering_trader ~ ~ ~
execute if score ?round.number exact.game matches 2 at @n[type=marker,tag=exact.tp.arena] run summon wandering_trader ~ ~ ~
execute if score ?round.number exact.game matches 2 run fill 10054 89 326 10068 89 312 emerald_ore
execute if score ?round.number exact.game matches 2 run fill 10054 88 326 10068 88 312 bedrock
execute if score ?round.number exact.game matches 2 run give @a[tag=!admin] diamond_pickaxe[can_break={blocks:["emerald_ore"]},enchantments={fortune:3}]

execute if score ?round.number exact.game matches 3 run gamerule block_drops false
execute if score ?round.number exact.game matches 3 at @a[tag=!admin] run summon sheep ~ ~ ~
execute if score ?round.number exact.game matches 3 at @a[tag=!admin] run summon cow ~ ~ ~
execute if score ?round.number exact.game matches 3 run give @a[tag=!admin] wheat 2

execute if score ?round.number exact.game matches 4 run gamerule block_drops true
execute if score ?round.number exact.game matches 4 run fillbiome 10055 90 325 10068 90 312 forest
execute if score ?round.number exact.game matches 4 run fill 10054 89 326 10068 89 312 grass_block
execute if score ?round.number exact.game matches 4 run item replace entity @a[tag=!admin] weapon.mainhand with golden_hoe[can_break={blocks:["poppy","dandelion","short_grass","tall_grass"]}]
execute if score ?round.number exact.game matches 4 run item replace entity @a[tag=!admin] weapon.offhand with bone_meal[can_place_on={blocks:["grass_block"]}] 64

execute if score ?round.number exact.game matches 5 run effect clear @a[tag=!admin] resistance
execute if score ?round.number exact.game matches 5 run gamerule block_drops false
execute if score ?round.number exact.game matches 5 run fill 10054 89 326 10068 89 312 air destroy
execute if score ?round.number exact.game matches 5 run fill 10054 88 326 10068 88 312 air
execute if score ?round.number exact.game matches 5 at @n[type=marker,tag=exact.tp.dropper] run spawnpoint @a[tag=!admin]

execute if score ?round.number exact.game matches 6 run tp @a[tag=!admin] @n[type=marker,tag=exact.tp.parkour]
execute if score ?round.number exact.game matches 6 at @n[type=marker,tag=exact.tp.parkour] run spawnpoint @a[tag=!admin]

execute if score ?round.number exact.game matches 7 at @n[type=marker,tag=exact.tp.arena] run fill ~2 ~18 ~2 ~-2 ~18 ~-2 target
execute if score ?round.number exact.game matches 7 run give @a[tag=!admin] ender_pearl 16

# this includes tag=admin so they can see the game objective as well
execute if score ?round.number exact.game matches 8 run scoreboard players set @a exact.sneakcount 50

execute if score ?round.number exact.game matches 9 run time set night
execute if score ?round.number exact.game matches 9 run fill 10054 89 326 10068 89 312 crafting_table
execute if score ?round.number exact.game matches 9 run item replace entity @a[tag=!admin] hotbar.0 with oak_planks 1
execute if score ?round.number exact.game matches 9 run item replace entity @a[tag=!admin] hotbar.3 with white_wool 1
execute if score ?round.number exact.game matches 9 run item replace entity @a[tag=!admin] hotbar.4 with red_wool 1
execute if score ?round.number exact.game matches 9 run item replace entity @a[tag=!admin] hotbar.6 with oak_planks 1
execute if score ?round.number exact.game matches 9 run item replace entity @a[tag=!admin] hotbar.7 with white_wool 1
execute if score ?round.number exact.game matches 9 run item replace entity @a[tag=!admin] inventory.1 with red_wool 1
execute if score ?round.number exact.game matches 9 run item replace entity @a[tag=!admin] inventory.3 with blue_wool 1
execute if score ?round.number exact.game matches 9 run item replace entity @a[tag=!admin] inventory.4 with oak_planks 1
execute if score ?round.number exact.game matches 9 run item replace entity @a[tag=!admin] inventory.6 with light_gray_wool 1
execute if score ?round.number exact.game matches 9 run item replace entity @a[tag=!admin] inventory.8 with green_wool 1
execute if score ?round.number exact.game matches 9 run item replace entity @a[tag=!admin] inventory.9 with gray_wool 1
execute if score ?round.number exact.game matches 9 run item replace entity @a[tag=!admin] inventory.11 with purple_wool 1
execute if score ?round.number exact.game matches 9 run item replace entity @a[tag=!admin] inventory.13 with green_wool 1
execute if score ?round.number exact.game matches 9 run item replace entity @a[tag=!admin] inventory.17 with red_wool 1
execute if score ?round.number exact.game matches 9 run item replace entity @a[tag=!admin] inventory.18 with purple_wool 1
execute if score ?round.number exact.game matches 9 run item replace entity @a[tag=!admin] inventory.19 with blue_wool 1
execute if score ?round.number exact.game matches 9 run item replace entity @a[tag=!admin] inventory.24 with light_gray_wool 1
execute if score ?round.number exact.game matches 9 run item replace entity @a[tag=!admin] inventory.26 with blue_wool 1
execute if score ?round.number exact.game matches 9 run recipe take @a[tag=!admin] *

execute if score ?round.number exact.game matches 10 run gamerule mob_drops false
execute if score ?round.number exact.game matches 10 run give @a[tag=!admin] bow
execute if score ?round.number exact.game matches 10 run give @a[tag=!admin] arrow 10
execute if score ?round.number exact.game matches 10 as @a[tag=!admin] at @s run summon chicken ~ ~30 ~

execute if score ?round.number exact.game matches 11 run difficulty hard
execute if score ?round.number exact.game matches 11 run team join exact.temp @a[tag=!admin]
execute if score ?round.number exact.game matches 11 as @a[tag=!admin] at @n[tag=exact.tp.arena] run summon creeper ~ ~ ~ {Team:"exact.temp",active_effects:[{id:"resistance",amplifier:5,duration:-1,show_particles:false}]}
execute if score ?round.number exact.game matches 11 run give @a[tag=!admin] flint_and_steel

execute if score ?round.number exact.game matches 12 run give @a[tag=!admin] bow
execute if score ?round.number exact.game matches 12 run give @a[tag=!admin] arrow 2

# this one is 35s
execute if score ?round.number exact.game matches 13 run scoreboard players add time.ingame_run exact.config 300
execute if score ?round.number exact.game matches 13 run give @a[tag=!admin] iron_block
execute if score ?round.number exact.game matches 13 run give @a[tag=!admin] hay_block
execute if score ?round.number exact.game matches 13 run give @a[tag=!admin] sugar_cane 3
execute if score ?round.number exact.game matches 13 run give @a[tag=!admin] turtle_egg
execute if score ?round.number exact.game matches 13 run give @a[tag=!admin] blue_egg
execute if score ?round.number exact.game matches 13 run give @a[tag=!admin] sniffer_egg
execute if score ?round.number exact.game matches 13 run give @a[tag=!admin] brown_egg
execute if score ?round.number exact.game matches 13 run give @a[tag=!admin] bowl 3
execute if score ?round.number exact.game matches 13 at @n[tag=exact.tp.arena] run summon mooshroom ~ ~ ~ {Type:red,active_effects:[{id:"resistance",amplifier:5,duration:-1,show_particles:false}]}
execute if score ?round.number exact.game matches 13 at @n[tag=exact.tp.arena] run summon mooshroom ~ ~ ~ {Type:brown,active_effects:[{id:"resistance",amplifier:5,duration:-1,show_particles:false}]}
execute if score ?round.number exact.game matches 13 at @n[tag=exact.tp.arena] run summon mooshroom ~ ~ ~ {Type:red,active_effects:[{id:"resistance",amplifier:5,duration:-1,show_particles:false}]}
execute if score ?round.number exact.game matches 13 at @n[tag=exact.tp.arena] run summon mooshroom ~ ~ ~ {Type:brown,active_effects:[{id:"resistance",amplifier:5,duration:-1,show_particles:false}]}
execute if score ?round.number exact.game matches 13 run fill 10054 89 326 10068 89 312 crafting_table

execute if score ?round.number exact.game matches 14 run scoreboard players remove time.ingame_run exact.config 300
execute if score ?round.number exact.game matches 14 run give @a[tag=!admin] golden_pickaxe[can_break={blocks:["stone"]}]
execute if score ?round.number exact.game matches 14 run give @a[tag=!admin] golden_shovel[can_break={blocks:["dirt","grass_block"]}]
execute if score ?round.number exact.game matches 14 run give @a[tag=!admin] golden_axe[can_break={blocks:["oak_planks"]}]
execute if score ?round.number exact.game matches 14 as @a[tag=!admin] at @s run tp @s ~54 ~ ~

execute if score ?round.number exact.game matches 15 run give @a[tag=!admin] wooden_axe
execute if score ?round.number exact.game matches 15 as @a[tag=!admin] at @n[tag=exact.tp.arena] run summon vex ~ ~5 ~
execute if score ?round.number exact.game matches 15 as @a[tag=!admin] at @n[tag=exact.tp.arena] run summon vex ~ ~5 ~
execute if score ?round.number exact.game matches 15 as @a[tag=!admin] at @n[tag=exact.tp.arena] run summon vex ~ ~5 ~