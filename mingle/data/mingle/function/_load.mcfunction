# ============================================================
# mingle:_load
# Called by: minecraft:load
# Executor:  Server
#
# Initializes scoreboards and MAIN intro/outro configuration.
# ============================================================

# --- DECLARE GAME VARIABLES ---
scoreboard objectives add mingle.state dummy "game internal state"
scoreboard objectives add mingle.timer dummy "game internal timer"
scoreboard objectives add mingle.temp dummy "scratch values"
scoreboard objectives add mingle.hud dummy "hud values"
scoreboard objectives add mingle.stats.wins dummy "round wins"
scoreboard objectives add mingle.stats.losses dummy "round losses"
scoreboard objectives add mingle.stats.streak dummy "win streak"

# --- CONFIG VALUES ---
scoreboard players set phase.pregame mingle.temp 0
scoreboard players set phase.ingame_run mingle.temp 1
scoreboard players set phase.ingame_wait mingle.temp 2
scoreboard players set time.pregame mingle.temp 400
scoreboard players set time.ingame_run mingle.temp 600
scoreboard players set time.ingame_wait mingle.temp 200
scoreboard players set cp.radius mingle.temp 4

# --- INTRO ANIMATION AND TEXT ---
data modify storage main:intro mingle.camera_starting_coords set value "10000 100 50000"
data modify storage main:intro mingle.player_starting_coords set value "10000 64 50000"

data modify storage main:intro mingle.howtoplay set value []
data modify storage main:intro mingle.howtoplay append value \
    [\
        "In Mingle, each round rolls a target group size.",\
        "Find a control point and group up quickly.",\
        "Only exact group sizes count as correct.",\
        "Anyone not in a correct group loses the round.",\
        "There are 15 rounds total.",\
        "Pregame lasts 20 seconds.",\
    ]
data modify storage main:intro mingle.howtoplay append value \
    [\
        "Round flow: 30s run and 10s wait.",\
        "Run: gather at active control points.",\
        "Wait: winners and losers are resolved.",\
        "Control points are disabled during wait.",\
        "After round 15 the game ends.",\
        "Good luck!",\
    ]

# --- OUTRO LEADERBOARD SLIDES ---
data remove storage main:outro mingle.stats
data modify storage main:outro mingle.stats append value { \
    objective: "mingle.stats.wins",\
    name: "Most winning rounds:",\
    sortby: ">",\
    prefix: "",\
    suffix: " wins",\
    numberformat: 0,\
}
data modify storage main:outro mingle.stats append value { \
    objective: "mingle.stats.losses",\
    name: "Most losing rounds:",\
    sortby: ">",\
    prefix: "",\
    suffix: " losses",\
    numberformat: 0,\
}
