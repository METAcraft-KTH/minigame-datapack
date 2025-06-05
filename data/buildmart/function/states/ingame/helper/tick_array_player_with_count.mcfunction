$data modify storage buildmart:valid_items current_item set string storage buildmart:valid_items items[$(init_items_array_ptr)]

function buildmart:states/ingame/helper/convert_id_to_tag {src: "storage buildmart:valid_items current_item", dst: "storage buildmart:valid_items current_tag"}

function buildmart:states/ingame/helper/tick_array_player_with_current_item with storage buildmart:valid_items
