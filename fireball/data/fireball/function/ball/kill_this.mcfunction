execute if entity @s[tag=!root,tag=fireball] run return fail

# warn-off execute-group
execute on passengers on passengers run kill @s
execute on passengers run kill @s
scoreboard players reset @s fireball.wack_age
return run kill @s