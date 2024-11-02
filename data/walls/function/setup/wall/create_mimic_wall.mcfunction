#toMimic: The id of the wall to mimic.
$scoreboard players set #toMimic WALLS.tmp $(toMimic)
function walls:setup/wall/internal/create_wall {action: "function walls:setup/wall/internal/set_wall_data_mimic"}
