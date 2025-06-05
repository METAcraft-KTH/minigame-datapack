$data modify entity @s item.id set from storage buildmart:valid_items items[$(current_display_index)]
function buildmart:clear_tags

function buildmart:states/ingame/helper/convert_id_to_tag {src: "entity @s item.id", dst: "storage buildmart:valid_items current_tag"}

function buildmart:states/ingame/helper/set_item_for_display_tag with storage buildmart:valid_items
