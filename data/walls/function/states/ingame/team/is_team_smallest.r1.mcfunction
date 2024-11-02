# smallest
# team2
# team3
# team4

$execute if score $(smallest).playercount WALLS.persistent_data <= $(team2).playercount WALLS.persistent_data if score $(smallest).playercount WALLS.persistent_data <= $(team3).playercount WALLS.persistent_data if score $(smallest).playercount WALLS.persistent_data <= $(team4).playercount WALLS.persistent_data run return 1
return fail
