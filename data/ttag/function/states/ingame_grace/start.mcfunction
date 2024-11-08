# This function is called when the tagging phase ends.
scoreboard players set ?state ttag.game 22

# initialize timer
execute store result bossbar ttag:timer max run scoreboard players get time.ingame_grace ttag.config
scoreboard players set ?timer ttag.game 0

bossbar set ttag:timer color green

# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1
execute as @a[tag=!admin] run function ttag:states/ingame_grace/reset_player

## DETONATE ALL TNT
tag @a remove ttag.died
execute at @a[team=ttag.tagged] run summon creeper ~ ~ ~ {Fuse:0,ExplosionRadius:4,attributes:[{id:"minecraft:scale",base:0f}],CustomName:'"TNT"'}