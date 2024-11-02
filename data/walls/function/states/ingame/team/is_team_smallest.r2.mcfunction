# smallest
# team2

$execute if score $(smallest).playercount WALLS.persistent_data <= $(team2).playercount WALLS.persistent_data run return 1
return fail
