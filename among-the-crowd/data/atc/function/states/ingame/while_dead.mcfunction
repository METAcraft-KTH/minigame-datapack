# This function is run every tick while the player is in the respawn menu (or just 1 tick if doImmediateRespawn is true).

## !!!ADD BELOW!!! do whatever you need.
# remember that things like awarding kills is better done with advancements.
execute if entity @s[team=atc.hiders] run tag @s add atc.hider_death
execute if entity @s[team=atc.hiders] run team join atc.seekers @s
execute if entity @s[tag=atc.hider_death] as @a[team=atc.hiders] run function score:add_points {points: 10}
tag @s remove atc.hider_death
