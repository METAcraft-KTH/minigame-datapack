# This function is run every tick while the player is in the respawn menu (or just 1 tick if doImmediateRespawn is true).

## !!!ADD BELOW!!! do whatever you need.
# remember that things like awarding kills is better done with advancements.

gamemode spectator
execute at @s run function survivalgames:run_with_range {function: "survivalgames:grant_points_death"}
