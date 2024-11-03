## Called when a player has GLOBAL.player_in_state undefined
scoreboard players set @s GLOBAL.player_in_state 1


tp @a @n[tag=qq.spawnpoint, tag=qq.active_arena]
gamemode adventure @s
function qq:states/ingame/reset_inventory
clear @s arrow