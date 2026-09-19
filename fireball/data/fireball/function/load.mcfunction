scoreboard objectives add fireball dummy
scoreboard objectives add fireball.wack_age dummy
scoreboard objectives add math dummy
scoreboard objectives add temp dummy
scoreboard objectives add fireball.spin_tick dummy
scoreboard objectives add fireball.step_count dummy
scoreboard objectives add fireball.bounce_count dummy
scoreboard players set #1000 math 1000
scoreboard objectives add fireball.death deathCount

team add fireball.black "Team Blackstone"
team modify main.it collisionRule pushOtherTeams
team modify fireball.black color dark_gray
team modify main.it friendlyFire false

team add fireball.red "Team Nether Brick"
team modify main.data collisionRule pushOtherTeams
team modify fireball.red color red
team modify main.data friendlyFire false

gamerule block_drops false
gamerule spawn_mobs false
gamerule immediate_respawn true
gamerule fire_damage true
gamerule natural_health_regeneration true

function fireball:uuid/load


# if config not set, set default or warn
execute \
    unless data storage fireball:config start_speed \
        run function fireball:config/set_start_speed {speed:0.4}

execute \
    unless data storage fireball:config red_spawn_x \
        run tellraw @a ["",{text:"[Fireball] WARNING: Red team spawn not set",bold:true,color:red}]

execute \
    unless data storage fireball:config black_spawn_x \
        run tellraw @a ["",{text:"[Fireball] WARNING: Black team spawn not set",bold:true,color:red}]

execute \
    unless data storage fireball:config arena_dimension \
        run tellraw @a ["",{text:"[Fireball] WARNING: Arena Dimension not set",bold:true,color:red}]
