# ran on the root entity
tag @s add this_fireball

## Target
# if we have a target, mark it
execute if data entity @s data.target_uuid_string run function fireball:ball/mark_target with entity @s data
# if marking failed then we dont have a target, select a random target
execute unless entity @a[tag=fireball.target,predicate=fireball:valid_target] as @r[predicate=fireball:valid_target] run function fireball:ball/set_target

## Tick stuff
scoreboard players add @s fireball.wack_age 1
execute on passengers run function fireball:ball/tick_passengers


## move (contains collision check)
function fireball:ball/move


tag @a[tag=fireball.target] remove fireball.target
tag @s remove this_fireball