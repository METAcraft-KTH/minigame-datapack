# smallest
# other
# other2

$execute if score $(smallest).playercount WALLS.persistent_data <= $(other).playercount WALLS.persistent_data if score $(smallest).playercount WALLS.persistent_data <= $(other2).playercount WALLS.persistent_data run return 1
return fail
