advancement revoke @s everything
function buildmart:clear_tags
advancement grant @s only buildmart:items/root
function buildmart:states/ingame/helper/prepare_array_iteration with storage buildmart:valid_items
tp @s @n[tag=buildmart.tp.arena]
clear @s
function buildmart:give/tools
execute at @s run spawnpoint @s ~ ~ ~
gamemode adventure @s
