# ============================================================
# Called by: The minigame, when Data has won the game.
#
# Awards Data the series point, then ends the game exactly
# the way main:api/end_game does.
#
# Use plain main:api/end_game for a draw / nobody-won result.
# ============================================================

# guarded the same way as end_game, so a stray call can't pad the score
execute unless score ?superstate main.state matches 3 run return 0

scoreboard players add ?wins_data main.state 1
function main:util/show_standings

function main:api/end_game
