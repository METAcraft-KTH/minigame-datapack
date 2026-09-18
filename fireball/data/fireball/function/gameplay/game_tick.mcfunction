# warn-off-file execute-group
scoreboard players add #game_time fireball 1
scoreboard players add #fireball_spawntime fireball 1

## become spectator when dead
execute as @a[scores={fireball.death=1..}] run function fireball:gameplay/on_death

## spawn fireball
execute if score #fireball_count fireball matches ..5 if score #fireball_spawntime fireball matches 100.. run function fireball:gameplay/spawn_new_ball
execute unless score #fireball_count fireball matches ..5 if score #fireball_spawntime fireball matches 200.. run function fireball:gameplay/spawn_new_ball

## end game when only one team stands
execute if score #2teams fireball matches 1 unless entity @a[predicate=fireball:valid_target,team=fireball.black] run return run function fireball:gameplay/victory_red
execute if score #2teams fireball matches 1 unless entity @a[predicate=fireball:valid_target,team=fireball.red] run return run function fireball:gameplay/victory_black

## end game when no one stands
execute unless entity @a[predicate=fireball:valid_target] run return run function fireball:gameplay/game_over

## intro
execute if score #game_time fireball matches 201.. run return 1
# intro 1s
execute if score #game_time fireball matches 20 run tellraw @a ["",{text:"Welcome to Not Rocket League!",bold:true,color:gold}]
execute if score #game_time fireball matches 20 as @a at @s run playsound block.note_block.snare ui @s ~ ~ ~ 1 1 1
# intro 2s
execute if score #game_time fireball matches 40 run tellraw @a ["",{text:"Win by being the last team standing",color:yellow}]
execute if score #game_time fireball matches 40 as @a at @s run playsound block.note_block.snare ui @s ~ ~ ~ 1 1 1
# intro 3s
execute if score #game_time fireball matches 60 run tellraw @a ["",{text:"Hit the Fireball with your Bat and don't get hit by the fireball yourself.",color:yellow}]
execute if score #game_time fireball matches 60 as @a at @s run playsound block.note_block.snare ui @s ~ ~ ~ 1 1 1
# intro 5s
execute if score #game_time fireball matches 100 run tellraw @a ["",{text:"When hit by the fireball, it will explode, taking the floor with it!",color:yellow}]
execute if score #game_time fireball matches 100 as @a at @s run playsound block.note_block.snare ui @s ~ ~ ~ 1 1 1
# intro 8s
execute if score #game_time fireball matches 160 run tellraw @a ["",{text:"Don't fall in the lava!",color:yellow}]
execute if score #game_time fireball matches 160 as @a at @s run playsound block.note_block.snare ui @s ~ ~ ~ 1 1 1
# intro 9s
execute if score #game_time fireball matches 180 run tellraw @a ["",{text:"Good luck!",color:gold}]
execute if score #game_time fireball matches 180 as @a at @s run playsound block.note_block.snare ui @s ~ ~ ~ 1 1 1
# intro 10s
execute if score #game_time fireball matches 200 as @a run scoreboard players set #fireball_count fireball 1
execute if score #game_time fireball matches 200 as @a run function fireball:gameplay/spawn_new_ball
execute if score #game_time fireball matches 200 as @a at @s run playsound entity.ender_dragon.growl ui @s ~ ~ ~ 1 1 1
