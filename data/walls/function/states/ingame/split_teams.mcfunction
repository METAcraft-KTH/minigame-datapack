#roundID The round id.

scoreboard players set blue.playercount WALLS.persistent_data 0
scoreboard players set red.playercount WALLS.persistent_data 0
scoreboard players set green.playercount WALLS.persistent_data 0
scoreboard players set yellow.playercount WALLS.persistent_data 0

team empty WALLS.blue
team empty WALLS.red
team empty WALLS.green
team empty WALLS.yellow

execute as @a[tag=!admin] run function walls:states/ingame/join_team
