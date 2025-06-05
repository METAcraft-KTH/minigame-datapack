execute store result score #max buildmart.game run data get storage buildmart:valid_items item_generator
scoreboard players remove #max buildmart.game 1
execute store result storage buildmart:valid_items max int 1 run scoreboard players get #max buildmart.game
function buildmart:states/ingame/helper/randomize with storage buildmart:valid_items
function buildmart:states/ingame/helper/update_selected with storage buildmart:valid_items
