# --- DECLARE GAME VARIABLES ---
scoreboard objectives add gamename.state dummy "game-internal states"

# --- STATS VARIABLES ---
#   these are (typically) assigned-once variables used to
#   display personal/leaderboard stats to the players
#   after the game is over.

# --- INTRO ANIMATION AND TEXT ---
data remove storage main:intro gamename
data modify storage main:intro gamename append value ""