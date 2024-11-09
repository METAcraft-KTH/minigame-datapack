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

# reset beacons
execute at @n[tag=ttag.arena1.beacon] run setblock ~ ~ ~ grass_block
execute at @n[tag=ttag.arena2.beacon] run setblock ~ ~ ~ grass_block

# spawnpoint for each arena (notice different cutoffs compared to ingame_tag's spawnpoint setter)
execute if score ?round ttag.game < round.arena2 ttag.config run spawnpoint @a[tag=!admin] 10000 64 0 0
execute if score ?round ttag.game >= round.arena2 ttag.config if score ?round ttag.game < round.arena3 ttag.config at @n[tag=ttag.arena2.spawn] run spawnpoint @a[tag=!admin] ~ ~ ~ 0
execute if score ?round ttag.game >= round.arena3 ttag.config at @n[tag=ttag.arena3.spawn] run spawnpoint @a[tag=!admin] ~ ~ ~ 0

## kill if not evacuated
execute if score ?round ttag.game = round.arena2 ttag.config run kill @a[tag=!admin,tag=!ttag.arena2.player]
execute if score ?round ttag.game = round.arena3 ttag.config run kill @a[tag=!admin,tag=!ttag.arena3.player]

## DETONATE ALL TNT (at head height)
tag @a remove ttag.died
gamerule showDeathMessages false
execute at @a[team=ttag.tagged] run summon creeper ~ ~1.6 ~ {Fuse:0,ExplosionRadius:4,attributes:[{id:"minecraft:scale",base:0f}],CustomName:'"TNT"'}