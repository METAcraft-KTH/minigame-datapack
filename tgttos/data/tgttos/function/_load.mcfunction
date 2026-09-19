# ============================================================
# tgttos:_load
# Called by: minecraft:load
# Executor:  Server
#
# Declares objectives and bossbars, and hands MAIN the intro
# cutscene / outro leaderboard configuration.
# ============================================================

# --- DECLARE GAME VARIABLES ---
scoreboard objectives add tgttos.state dummy "game internal state"
scoreboard objectives add tgttos.timer dummy "game internal timers"
scoreboard objectives add tgttos.temp dummy "scratch values"

# --- BOSSBARS ---
#   one per team, counting their 3:00 objective timer down.
#   the bar only moves while that team holds both control points.
bossbar add tgttos:data "Data"
bossbar set tgttos:data color pink
bossbar set tgttos:data style progress
bossbar set tgttos:data max 3600
bossbar set tgttos:data visible false
bossbar add tgttos:it "IT"
bossbar set tgttos:it color purple
bossbar set tgttos:it style progress
bossbar set tgttos:it max 3600
bossbar set tgttos:it visible false


# --- INTRO ANIMATION AND TEXT ---

# The camera always looks due south and drifts forward at 0.5 b/s, so
# it starts north of the spawn platforms on the map's centre line and
# flies down the length of the map: both platforms first, then both
# control points and their beacon beams.
data modify storage main:intro tgttos.camera_starting_coords set value "20000 88 59945 0 22"

# MAIN drops everyone on one coordinate, so they all land on the Data
# platform for a single tick and tgttos:on/gamestart immediately sends
# IT west. Yaw 0 is due south, facing the control points.
data modify storage main:intro tgttos.player_starting_coords set value "20025 64 60000 0 0"

data modify storage main:intro tgttos.howtoplay set value []
data modify storage main:intro tgttos.howtoplay append value \
    [\
        "Two control points, out on islands 100 blocks from your spawn.",\
        ["",{text:"Data",color:"#e83d84"}," and ",{text:"IT",color:"#cc99ff"}," start on their own platform, and nothing connects them."],\
        "We'll cross that bridge when we get there. Build it yourself.",\
        "",\
        "You get infinite team-coloured concrete that places on anything,",\
        "an efficiency 4 pickaxe that breaks it, a bow, and 3 arrows.",\
    ]
data modify storage main:intro tgttos.howtoplay append value \
    [\
        ["",{text:"Arrows destroy concrete.",color:"yellow",bold:true}],\
        "Every bridge is concrete, including the one under your feet.",\
        "You get one more arrow every 5 seconds — spend them well.",\
        "",\
        "Stand within 5 blocks of the beacon for 10 seconds to capture it.",\
        "An enemy standing there with you freezes the capture for both.",\
    ]
data modify storage main:intro tgttos.howtoplay append value \
    [\
        "Taking a point off someone means rewinding their progress first,",\
        "and a point never goes back to neutral once somebody owns it.",\
        ["",{text:"Hold BOTH points",color:"yellow",bold:true}," to run your 3:00 timer down to zero."],\
        "",\
        "The winning team takes 1 point in the best-of-5.",\
        "The intro ends after this slide fades out!",\
    ]


# --- STATS VARIABLES ---
#   assigned-once per-player values used for the outro leaderboard
scoreboard objectives add tgttos.st.kills dummy
scoreboard objectives add tgttos.st.caps dummy
scoreboard objectives add tgttos.st.blocks dummy


# --- OUTRO LEADERBOARD SLIDES ---
data modify storage main:outro tgttos.stats set value []
data modify storage main:outro tgttos.stats append value { \
    objective: "tgttos.st.kills",\
    name: "Top killers:",\
    sortby: ">",\
    prefix: "",\
    suffix: " kills",\
    numberformat: 0,\
}
data modify storage main:outro tgttos.stats append value { \
    objective: "tgttos.st.caps",\
    name: "Most captures:",\
    sortby: ">",\
    prefix: "",\
    suffix: " points taken",\
    numberformat: 0,\
}
data modify storage main:outro tgttos.stats append value { \
    objective: "tgttos.st.blocks",\
    name: "Most bridge destroyed:",\
    sortby: ">",\
    prefix: "",\
    suffix: " blocks",\
    numberformat: 0,\
}
