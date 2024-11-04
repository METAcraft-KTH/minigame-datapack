# increment checkpoint
scoreboard players add @s hh.checkpoint 1

# find next checkpoint
execute as @e[tag=hh.checkpoint] if score @s hh.checkpoint = @p[tag=this] hh.checkpoint run tag @s add thisCP

# return if no checkpoint was found
execute unless entity @e[tag=thisCP] run scoreboard players remove @s hh.checkpoint 1
execute unless entity @e[tag=thisCP] run scoreboard players reset @s hh.skip
execute unless entity @e[tag=thisCP] run return run tellraw @s {"text":"Could not skip. You are on the last checkpoint.","color":"red"}

# set spawnpoint
execute at @n[tag=thisCP] run spawnpoint @s ~ ~ ~ ~
tag @e[tag=thisCP] remove thisCP

# disallow skipping
function hh:states/ingame/disallow_skipping

# kill @s then reset checkpointDeaths
kill @s
scoreboard players reset @s hh.checkpointDeaths