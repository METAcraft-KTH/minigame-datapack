# ============================================================
# exact:_load
# Executed on /reload via minecraft:load tag
# Initializes all scoreboard objectives and game configuration
# ============================================================

# --- DECLARE GAME VARIABLES ---
scoreboard objectives add exact.state dummy "Game state tracking"
scoreboard objectives add exact.timer dummy "Game timer"

# --- INTRO ANIMATION AND TEXT ---
# Camera position for intro cutscene
data modify storage main:intro exact.camera_starting_coords set value "0 64 0"

# Player spawn position when intro ends
data modify storage main:intro exact.player_starting_coords set value "0 64 0"

# How-to-play slides (6 rows per slide, shown in 10-second intervals)
data modify storage main:intro exact.howtoplay set value []
data modify storage main:intro exact.howtoplay append value \
    [\
        {text:"Welcome to EXACT!",color:"gold",bold:true},\
        "",\
        "Complete 16 different tasks in rapid succession.",\
        "Read the subtitle for instructions in each round.",\
        "You have 20 seconds per task!",\
        "",\
    ]
data modify storage main:intro exact.howtoplay append value \
    [\
        "Each task is validated automatically.",\
        "Complete it, and you'll see:",\
        {text:"SUCCESS",color:"green",bold:true},\
        "",\
        "Fail to complete it by the time limit?",\
        {text:"FAILURE",color:"red"},\
    ]
data modify storage main:intro exact.howtoplay append value \
    [\
        "After 16 rounds, the game ends.",\
        "",\
        "Complete the task.",\
        "Be quick.",\
        "Be exact.",\
        "",\
    ]

# --- STATS VARIABLES ---
scoreboard objectives add exact.stats.wins dummy "Rounds won"

# --- OUTRO LEADERBOARD SLIDES ---
data modify storage main:outro exact.stats append value { \
    objective: "exact.stats.wins",\
    name: "Rounds Completed:",\
    sortby: ">",\
    prefix: "",\
    suffix: " / 16",\
    numberformat: 0,\
}
