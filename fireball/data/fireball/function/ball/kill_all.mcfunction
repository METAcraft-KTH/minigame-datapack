# warn-off-file execute-group
# warn-off-file target-selector-no-dimension
# warn-off-file target-selector-no-type
execute as @e[tag=fireball,tag=root] on passengers on passengers run kill @s
execute as @e[tag=fireball,tag=root] on passengers run kill @s
scoreboard players reset * fireball.wack_age
return run kill @e[tag=fireball,tag=root]

