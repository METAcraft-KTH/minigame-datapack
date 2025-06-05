execute store result storage buildmart:valid_items count int 1 run scoreboard players get count.items buildmart.config
function buildmart:states/ingame/prepare_storage with storage buildmart:valid_items

execute as @e[scores={buildmart.display_index=-2147483648..2147483647}]:
	execute store result storage buildmart:valid_items current_display_index int 1 run scoreboard players get @s buildmart.display_index
	function buildmart:states/ingame/helper/set_item_for_display with storage buildmart:valid_items
