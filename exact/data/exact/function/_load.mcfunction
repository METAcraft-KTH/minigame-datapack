# ============================================================
# exact:_load
# Executed on /reload via minecraft:load tag
# Initializes all scoreboard objectives and game configuration
# ============================================================

# --- DECLARE GAME VARIABLES ---
scoreboard objectives add exact.state dummy "Game state tracking"
scoreboard objectives add exact.timer dummy "Game timer"
scoreboard objectives add exact.is_sneaking dummy "Round 8 sneak latch"
scoreboard objectives add exact.sneakcount dummy "Round 8 remaining sneaks"
scoreboard objectives add exact.quickmath trigger "Round 8 trigger"
scoreboard objectives add exact.y_start dummy "Round 15 start Y"
scoreboard objectives add exact.y_now dummy "Round 15 current Y"

# Last round whose result was settled for this player (see exact:util/catchup).
# Players who were offline while rounds were settled pay for them on rejoin.
scoreboard objectives add exact.lastround dummy "Last round played"

# --- INTRO ANIMATION AND TEXT ---
# Camera position for intro cutscene
data modify storage main:intro exact.camera_starting_coords set value "50000 105 49960"

# Player spawn position when intro ends
data modify storage main:intro exact.player_starting_coords set value "50000 100 50000"

# How-to-play slides (6 rows per slide, shown in 10-second intervals)
data modify storage main:intro exact.howtoplay set value []
data modify storage main:intro exact.howtoplay append value \
    [\
        "Race to complete a random task ASAP!",\
        "Start with 5❤, lose 1❤ for each task you don't",\
        "complete in time.",\
        "First player to finish a task regains 1❤.",\
        "",\
        "0❤ = eliminated. Last team standing wins!",\
    ]
data modify storage main:intro exact.howtoplay append value \
    [\
        "After a % of players have completed the task,",\
        "the timer skips to 3 seconds left.",\
        "",\
        "This % gets lower every 5 rounds.",\
        "",\
        "Tasks will repeat after 30 rounds.",\
    ]

# --- STATS VARIABLES ---
scoreboard objectives add exact.stats.wins dummy

# Team used by round 11 task entities
team add exact.temp

# --- OUTRO LEADERBOARD SLIDES ---
data modify storage main:outro exact.stats set value []
data modify storage main:outro exact.stats append value { \
    objective: "exact.stats.wins",\
    name: "Rounds Completed:",\
    sortby: ">",\
    prefix: "",\
    suffix: " rounds",\
    numberformat: 0,\
}
