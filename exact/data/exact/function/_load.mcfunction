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
data modify storage main:intro exact.camera_starting_coords set value "50000 105 49960"

# Player spawn position when intro ends
data modify storage main:intro exact.player_starting_coords set value "50000 100 50000"

# How-to-play slides (6 rows per slide, shown in 10-second intervals)
data modify storage main:intro exact.howtoplay set value []
data modify storage main:intro exact.howtoplay append value \
    [\
        "In this game, you'll be given various tasks to follow.",\
        "",\
        "The faster you complete them, the more 💎 you earn!",\
        "",\
        "All tasks also have a time limit.",\
        "If you don't complete a task in time, you earn nothing.",\
    ]
data modify storage main:intro exact.howtoplay append value \
    [\
        ["",{text:"How to earn ",color:"yellow",bold:true},"💎",{text:" in this game:",color:"yellow",bold:true}],\
        "",\
        "When you finish a task, +2💎 for each person",\
        "who still hasn't finished",\
        "",\
        "Extra +150~10💎 for the fastest 20 players",\
    ]

# --- STATS VARIABLES ---
scoreboard objectives add exact.stats.wins dummy "Rounds won"

# --- OUTRO LEADERBOARD SLIDES ---
data modify storage main:outro exact.stats append value { \
    objective: "exact.stats.wins",\
    name: "Rounds Completed:",\
    sortby: ">",\
    prefix: "",\
    suffix: " rounds",\
    numberformat: 0,\
}
