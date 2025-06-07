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


scoreboard players add ?round.number exact.game 1


tellraw @a [{"text":"ROUND ","text":"gold",bold:true},{score:{name:"?round.number",objective:"exact.game"}}]


execute if score ?round.number exact.game matches 1 run gamerule doTileDrops true
execute if score ?round.number exact.game matches 1 run give @a[tag=!admin] diamond_pickaxe[can_break={blocks:"lapis_ore"}]
execute if score ?round.number exact.game matches 1 run give @a[tag=!admin] experience_bottle 10
execute if score ?round.number exact.game matches 1 run fill 10080 93 300 10043 89 337 lapis_ore replace white_concrete_powder
execute if score ?round.number exact.game matches 1 run fill 10055 89 325 10068 89 312 enchanting_table

execute if score ?round.number exact.game matches 2 run gamerule doTileDrops false
execute if score ?round.number exact.game matches 2 as @a[tag=!admin] at @n[tag=exact.tp.arena] run summon sheep ~ ~ ~
execute if score ?round.number exact.game matches 2 run give @a[tag=!admin] shears

execute if score ?round.number exact.game matches 3 run fill 10080 93 300 10043 89 337 diamond_ore replace white_concrete_powder
execute if score ?round.number exact.game matches 3 run fill 10055 89 325 10068 89 312 crafting_table
execute if score ?round.number exact.game matches 3 run give @a[tag=!admin] diamond_pickaxe[can_break={blocks:"diamond_ore"},enchantments={fortune:3}]

execute if score ?round.number exact.game matches 4 run give @a[tag=!admin] beacon[can_place_on={blocks:"iron_block"}]

execute if score ?round.number exact.game matches 5 run give @a[tag=!admin] bow
execute if score ?round.number exact.game matches 5 run give @a[tag=!admin] arrow 10
execute if score ?round.number exact.game matches 5 as @a[tag=!admin] at @s run summon chicken ~ ~30 ~

execute if score ?round.number exact.game matches 6 at @n[tag=exact.tp.arena] run summon cow ~ ~ ~
execute if score ?round.number exact.game matches 6 run give @a[tag=!admin] bucket


execute if score ?round.number exact.game matches 8 as @a[tag=!admin] at @n[tag=exact.tp.arena] run summon wandering_trader ~ ~ ~
execute if score ?round.number exact.game matches 8 run fill 10055 89 325 10068 89 312 emerald_ore
execute if score ?round.number exact.game matches 8 run give @a[tag=!admin] diamond_pickaxe[can_break={blocks:"emerald_ore"},enchantments={fortune:3}]

execute if score ?round.number exact.game matches 9 run team join exact.temp @a[tag=!admin]
execute if score ?round.number exact.game matches 9 as @a[tag=!admin] at @n[tag=exact.tp.arena] run summon creeper ~ ~ ~ {Team:"exact.temp"}
execute if score ?round.number exact.game matches 9 run give @a[tag=!admin] flint_and_steel

execute if score ?round.number exact.game matches 10 as @a[tag=!admin] run team leave exact.temp
execute if score ?round.number exact.game matches 10 run fill 10080 93 300 10043 89 337 crafting_table replace white_concrete_powder
execute if score ?round.number exact.game matches 10 run fill 10055 89 325 10068 89 312 hay_block
execute if score ?round.number exact.game matches 10 run give @a[tag=!admin] diamond_hoe[can_break={blocks:"hay_block"}]


execute if score ?round.number exact.game matches 12 run item replace entity @a[tag=!admin] weapon.mainhand with oak_planks 64
execute if score ?round.number exact.game matches 12 run item modify entity @a[tag=!admin] weapon.mainhand exact:can_place_anywhere

execute if score ?round.number exact.game matches 13 as @a[tag=!admin] at @n[tag=exact.tp.arena] run summon sheep ~ ~ ~
execute if score ?round.number exact.game matches 13 run give @a[tag=!admin] wheat 2

execute if score ?round.number exact.game matches 14 run item replace entity @a[tag=!admin] weapon.mainhand with iron_block 4
execute if score ?round.number exact.game matches 14 run item modify entity @a[tag=!admin] weapon.mainhand exact:can_place_anywhere
execute if score ?round.number exact.game matches 14 run give @a[tag=!admin] carved_pumpkin[can_place_on={blocks:"iron_block"}] 1

execute if score ?round.number exact.game matches 15 run give @a[tag=!admin] diamond_sword
execute if score ?round.number exact.game matches 15 run item replace entity @a[tag=!admin] weapon.offhand with shield