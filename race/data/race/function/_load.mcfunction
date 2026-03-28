# ============================================================
# race:_load
# Called by: minecraft:load (data pack load)
# Executor:  Server
# ============================================================
# Initialize all scoreboards and set up intro/outro configuration.

# --- DECLARE GAME VARIABLES ---
scoreboard objectives add race.state dummy "Race - game state"
scoreboard objectives add race.timer dummy "Race - timers"
scoreboard objectives add race.checkpoint dummy "Race - current checkpoint"
scoreboard objectives add race.lap dummy "Race - lap counter"

# --- STATS VARIABLES ---
# Used for the outro leaderboard display
scoreboard objectives add race.stats.lap dummy "Race - laps completed"
scoreboard objectives add race.stats.time dummy "Race - finish time"


# --- INTRO ANIMATION AND TEXT ---

# Camera starting position for the intro cutscene
data modify storage main:intro race.camera_starting_coords set value "0 100 -50"

# Player spawn position when intro ends and game begins
data modify storage main:intro race.player_starting_coords set value "0 64 0"

# How-to-play slides (6 rows each, shown in 10-second intervals)
data modify storage main:intro race.howtoplay set value []
data modify storage main:intro race.howtoplay append value \
    [\
        "The race course is 3 laps and have several",\
        "checkpoints along the way.",\
        "",\
        "Checkpoints must be crossed in order,",\
        "or you'll be teleported back to the",\
        "previous checkpoint.",\
    ]
data modify storage main:intro race.howtoplay append value \
    [\
        "Along the course are special items:",\
        "- Elytra",\
        "- Building blocks",\
        "- Riptide Trident",\
        "",\
        "Use them to navigate the course!",\
    ]
data modify storage main:intro race.howtoplay append value \
    [\
        ["",{text:"How to earn ",color:"yellow",bold:true},"💎",{text:" in this game:",color:"yellow",bold:true}],\
        "",\
        "+220💎 when you finish a lap",\
        "(-3💎 for each person who finished the lap before you)",\
        "",\
        "+100💎 complete all 3 laps, regardless of order",\
    ]



# --- OUTRO LEADERBOARD SLIDES ---
# Display final standings after the game

data modify storage main:outro race.stats append value { \
    objective: "race.stats.lap",\
    name: "Laps Completed:",\
    sortby: ">",\
    prefix: "",\
    suffix: "/3",\
    numberformat: 0,\
}

data modify storage main:outro race.stats append value { \
    objective: "race.stats.time",\
    name: "Finish Time:",\
    sortby: "<",\
    prefix: "",\
    suffix: "",\
    numberformat: 3,\
}
