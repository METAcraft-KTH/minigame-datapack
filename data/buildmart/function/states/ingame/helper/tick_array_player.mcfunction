execute if score #init_items.array_ptr buildmart.game < #init_items.array_top buildmart.game:
	execute store result storage buildmart:valid_items init_items_array_ptr int 1 run scoreboard players get #init_items.array_ptr buildmart.game
	function buildmart:states/ingame/helper/tick_array_player_with_count with storage buildmart:valid_items
	scoreboard players add #init_items.array_ptr buildmart.game 1
	function buildmart:states/ingame/helper/tick_array_player

execute if score #init_items.array_ptr buildmart.game >= #init_items.array_top buildmart.game:
	scoreboard players reset #init_items.array_ptr buildmart.game
	scoreboard players reset #init_items.array_top buildmart.game

