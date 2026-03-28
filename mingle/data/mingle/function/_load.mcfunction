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
scoreboard objectives add mingle.streak dummy "win streak"
scoreboard objectives add mingle.stats.wins dummy "round wins"
scoreboard objectives add mingle.stats.losses dummy "round losses"
scoreboard objectives add mingle.stats.streak dummy "best win streak"
# teams for glow colors
team add mingle.glow.yellow ""
team add mingle.glow.green ""
team add mingle.glow.red ""
team modify mingle.glow.yellow color yellow
team modify mingle.glow.green color green
team modify mingle.glow.red color red

# --- CONFIG VALUES ---
scoreboard players set phase.pregame mingle.temp 0
scoreboard players set phase.ingame_run mingle.temp 1
scoreboard players set phase.ingame_wait mingle.temp 2
scoreboard players set time.pregame mingle.temp 400
scoreboard players set time.ingame_run mingle.temp 600
scoreboard players set time.ingame_wait mingle.temp 200
scoreboard players set cp.radius mingle.temp 4

# --- INTRO ANIMATION AND TEXT ---
data modify storage main:intro mingle.camera_starting_coords set value "40000 100 50000"
data modify storage main:intro mingle.player_starting_coords set value "40000 64 50000"

data modify storage main:intro mingle.howtoplay set value []
data modify storage main:intro mingle.howtoplay append value \
    [\
        "Each round, a group size is randomly chosen.",\
        ["You must find a ",{text:"capture point",color:"light_purple"}," and form a"],\
        "group with exactly that number of people",\
        "when the round ends.",\
        "",\
        "If you fall into the void, you'll TP to the map center.",\
    ]
data modify storage main:intro mingle.howtoplay append value \
    [\
        ["To find capture points, look for ",{text:"beacon beams",color:"light_purple"}," and glowing players:"],\
        "",\
        ["",{text:"Yellow",color:"yellow",bold:true}," = need more players"],\
        ["",{text:"Green",color:"green",bold:true}," = exactly the right group size"],\
        ["",{text:"Red",color:"red",bold:true}," = too many players"],\
    ]
data modify storage main:intro mingle.howtoplay append value \
    [\
        ["",{text:"How to earn ",color:"yellow",bold:true},"💎",{text:" in this game:",color:"yellow",bold:true}],\
        "",\
        "+40💎 per round won",\
        "Extra +10💎 for each consecutive win",\
        "",\
        "You do not earn extra 💎 for having fewer winners!",\
    ]

# --- OUTRO LEADERBOARD SLIDES ---
data remove storage main:outro mingle.stats
data modify storage main:outro mingle.stats append value { \
    objective: "mingle.stats.wins",\
    name: "Most rounds won:",\
    sortby: ">",\
    prefix: "",\
    suffix: " wins",\
    numberformat: 0,\
}
data modify storage main:outro mingle.stats append value { \
    objective: "mingle.stats.streak",\
    name: "Longest winning streak:",\
    sortby: ">",\
    prefix: "",\
    suffix: " wins in a row",\
    numberformat: 0,\
}
