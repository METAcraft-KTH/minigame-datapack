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

# Slide 1: Game overview
data modify storage main:intro race.howtoplay append value \
    [\
        {text:"Welcome to ",color:"green",bold:true},\
        {text:"RACE",color:"gold",bold:true},\
        "",\
        "Complete 3 laps of the obstacle course!",\
        "Cross all checkpoints in order to progress.",\
        "Fastest time wins!",\
    ]

# Slide 2: Checkpoints
data modify storage main:intro race.howtoplay append value \
    [\
        {text:"Checkpoints",color:"aqua",bold:true},\
        "Follow the markers through the course.",\
        "Skip a checkpoint? You'll be reset!",\
        "",\
        "Cross checkpoints in numerical order.",\
        "3 laps total to finish.",\
    ]

# Slide 3: Utilities
data modify storage main:intro race.howtoplay append value \
    [\
        {text:"Utilities",color:"yellow",bold:true},\
        "Special markers grant items:",\
        {text:"  • Elytra",color:"white"},\
        {text:"  • Building blocks",color:"white"},\
        {text:"  • Riptide Trident",color:"white"},\
        "Use them to navigate the course!",\
    ]

# Slide 4: Scoring
data modify storage main:intro race.howtoplay append value \
    [\
        {text:"Scoring",color:"light_purple",bold:true},\
        "Finish 3 laps to complete the race.",\
        "Your time is tracked automatically.",\
        "",\
        "The player with the fastest time wins!",\
        "Get ready...",\
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
