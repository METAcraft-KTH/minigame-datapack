## Called when a player has qq.in_state undefined
scoreboard players set @s qq.in_state 1


tp @s @e[tag=qq.spawnpoint,tag=qq.active_arena,limit=1,sort=random]
gamemode adventure @s
xp set @s 0 levels
xp set @s 0 points
function qq:states/ingame/reset_inventory
clear @s arrow