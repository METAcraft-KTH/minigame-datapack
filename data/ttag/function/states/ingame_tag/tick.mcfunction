## TAGGING: TNT has been distributed, go tag!

# manage rejoin etc
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function ttag:states/ingame_tag/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function ttag:states/ingame_tag/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function ttag:states/ingame_tag/respawn

# increment timer
scoreboard players add ?timer ttag.game 1
# calculate remaining time
scoreboard players operation #remainingseconds ttag.game = time.ingame_tag ttag.config
scoreboard players operation #remainingseconds ttag.game -= ?timer ttag.game
scoreboard players operation #remainingseconds ttag.game /= 20 GLOBAL
scoreboard players operation #displayminutes ttag.game = #remainingseconds ttag.game
scoreboard players operation #displayminutes ttag.game /= 60 GLOBAL
scoreboard players operation #displayseconds ttag.game = #remainingseconds ttag.game
scoreboard players operation #displayseconds ttag.game %= 60 GLOBAL
# display remaining time
execute if score #displayseconds ttag.game matches ..9 run bossbar set ttag:timer name ["All TNT explode in ",{"score": {"name": "#displayminutes","objective": "ttag.game"}},":0",{"score": {"name": "#displayseconds","objective": "ttag.game"}}]
execute if score #displayseconds ttag.game matches 10.. run bossbar set ttag:timer name ["All TNT explode in ",{"score": {"name": "#displayminutes","objective": "ttag.game"}},":",{"score": {"name": "#displayseconds","objective": "ttag.game"}}]
execute store result bossbar ttag:timer value run scoreboard players get ?timer ttag.game

## TODO: give points to tnt holders every 10 ticks

# give effects
effect give @a[team=ttag.tagged,tag=!admin] speed 2 3 true
effect give @a[team=ttag.tagged,tag=!admin] jump_boost 2 0 true
effect give @a[team=!ttag.tagged,tag=!admin] speed 2 1 true
effect give @a[tag=!admin] regeneration 2 9 true
# set player head
clear @a[team=!ttag.tagged,tag=!admin] tnt
execute as @a[team=ttag.tagged,tag=!admin] unless predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"slots":{"armor.head":{"items":"minecraft:player_head"}}}} run item replace entity @s armor.head with player_head[profile="MHF_TNT",enchantments={binding_curse:1},equippable={slot:"head"}]
execute as @a[team=ttag.tagged,tag=!admin] unless predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"slots":{"weapon.mainhand":{"items":"minecraft:tnt"}}}} run clear @s tnt
execute as @a[team=ttag.tagged,tag=!admin] unless predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"slots":{"weapon.mainhand":{"items":"minecraft:tnt"}}}} run item replace entity @s weapon.mainhand with tnt[item_name='{"text":"TNT","color":"red"}']
execute at @a[team=ttag.tagged,tag=!admin] run particle small_flame ~ ~.5 ~ .3 .3 .3 0 1

# assign tags on arena change
execute at @n[tag=ttag.arena2.entrance] run tellraw @a[tag=!ttag.arena2.player,distance=..5] {"text":"\nSuccessfully evacuated!\n","color":"yellow"}
execute at @n[tag=ttag.arena2.entrance] run playsound entity.arrow.hit_player master @a[tag=!ttag.arena2.player,distance=..5]
execute at @n[tag=ttag.arena2.entrance] as @a[tag=!ttag.arena2.player,distance=..5] run function score:add_points {points:30}
execute at @n[tag=ttag.arena2.entrance] run tag @a[tag=!ttag.arena2.player,distance=..5] add ttag.arena2.player

execute at @n[tag=ttag.arena3.entrance] run tellraw @a[tag=!ttag.arena3.player,distance=..5] {"text":"\nSuccessfully evacuated!\n","color":"yellow"}
execute at @n[tag=ttag.arena3.entrance] run playsound entity.arrow.hit_player master @a[tag=!ttag.arena3.player,distance=..5]
execute at @n[tag=ttag.arena3.entrance] as @a[tag=!ttag.arena3.player,distance=..5] run function score:add_points {points:50}
execute at @n[tag=ttag.arena3.entrance] run tag @a[tag=!ttag.arena3.player,distance=..5] add ttag.arena3.player

# actionbar info
title @a[team=ttag.tagged,tag=!admin] actionbar [{"text":"YOU ARE HOLDING TNT!","color":"red","bold":true},{"text":" Punch someone else to give it away!","bold":false}]
title @a[team=!ttag.tagged,tag=!admin] actionbar "You are not holding TNT, avoid players who do!"
execute if score ?round ttag.game = round.arena2 ttag.config run title @a[team=!ttag.tagged,tag=!admin,tag=!ttag.arena2.player] actionbar {"text":"Evacuate to the next arena before the round ends!","color":"yellow"}
execute if score ?round ttag.game = round.arena3 ttag.config run title @a[team=!ttag.tagged,tag=!admin,tag=!ttag.arena3.player] actionbar {"text":"Evacuate to the next arena before the round ends!","color":"yellow"}

# spawnpoint for each arena
execute if score ?round ttag.game <= round.arena2 ttag.config run spawnpoint @a[tag=!admin] 10000 64 0 0
execute if score ?round ttag.game > round.arena2 ttag.config if score ?round ttag.game <= round.arena3 ttag.config at @n[tag=ttag.arena2.spawn] run spawnpoint @a[tag=!admin] ~ ~ ~ 0
execute if score ?round ttag.game > round.arena3 ttag.config at @n[tag=ttag.arena3.spawn] run spawnpoint @a[tag=!admin] ~ ~ ~ 0

# force game mode
gamemode adventure @a[tag=!admin,gamemode=!adventure]

## end round
execute if score ?timer ttag.game >= time.ingame_tag ttag.config run function ttag:states/ingame_grace/start