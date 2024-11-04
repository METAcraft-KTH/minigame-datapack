# This function is called when the playable part of the minigame ends.
scoreboard players set ?state qq.game 3

# new state, reset GLOBAL.player_in_state
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1

# initialize timer
execute store result bossbar qq:timer max run scoreboard players get time.postgame qq.config
scoreboard players set ?timer qq.game 0

# pvp off
team modify qq.players friendlyFire false

# clear effects
effect clear @a[tag=!admin] speed
effect clear @a[tag=!admin] weakness
effect clear @a[tag=!admin] invisibility

# respawn everyone
scoreboard players add @a[gamemode=spectator,tag=!admin] GLOBAL.time_alive 60
execute as @a[gamemode=spectator,tag=!admin] run tp @s @e[tag=qq.spawnpoint,tag=qq.active_arena,limit=1,sort=random]
gamemode adventure @a[gamemode=spectator,tag=!admin]