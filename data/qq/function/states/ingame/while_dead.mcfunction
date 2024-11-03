# This function is run every tick while the player is in the respawn menu (or just 1 tick if doImmediateRespawn is true).

## !!!ADD BELOW!!! do whatever you need.
# remember that things like awarding kills is better done with advancements.
gamemode spectator @s
execute at @s run tp @s @e[tag=qq.spectate,tag=qq.active_arena,limit=1,sort=random]

tag @s remove hit