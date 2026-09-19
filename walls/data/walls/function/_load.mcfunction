# ============================================================
# walls:_load
# Called by: minecraft:load
# Executor:  Server
#
# Declares objectives, teams and bossbars, and hands MAIN the
# intro cutscene / outro leaderboard configuration.
# ============================================================

# --- DECLARE GAME VARIABLES ---
scoreboard objectives add walls.state dummy "game internal state"
scoreboard objectives add walls.timer dummy "game internal timers"
scoreboard objectives add walls.temp dummy "scratch values"
scoreboard objectives add walls.respawn dummy "ticks until respawn"
#   last known block position of every living player, used to drop
#   crystals where they died (they have already respawned by the time
#   MAIN tells us about the death)
scoreboard objectives add walls.x dummy "last known X"
scoreboard objectives add walls.y dummy "last known Y"
scoreboard objectives add walls.z dummy "last known Z"

# --- TEAMS ---
#   players use MAIN's teams (main.it / main.data).
#   this one only exists so shopkeepers can't be shoved around.
team add walls.shop "Shop"
team modify walls.shop collisionRule never

# --- BOSSBARS ---
#   each team's two ravagers share one 600 HP bar (300 HP each)
bossbar add walls:it "IT Ravagers"
bossbar set walls:it color purple
bossbar set walls:it style notched_6
bossbar set walls:it max 600
bossbar set walls:it visible false
bossbar add walls:data "Data Ravagers"
bossbar set walls:data color pink
bossbar set walls:data style notched_6
bossbar set walls:data max 600
bossbar set walls:data visible false
#   countdown to the wall dropping
bossbar add walls:timer ""
bossbar set walls:timer color white
bossbar set walls:timer style progress
bossbar set walls:timer max 12000
bossbar set walls:timer visible false


# --- INTRO ANIMATION AND TEXT ---

# Camera flies south down the length of the bedrock wall.
data modify storage main:intro walls.camera_starting_coords set value "30000 100 59850 0 25"

# MAIN drops everyone on one coordinate, so they all land on the IT spawn
# for a single tick and walls:on/gamestart immediately sends Data east.
# (Standing them in the middle instead would put them inside the wall.)
data modify storage main:intro walls.player_starting_coords set value "29880 64 60000 -90 0"

data modify storage main:intro walls.howtoplay set value []
data modify storage main:intro walls.howtoplay append value \
    [\
        "Normal survival for 10 minutes, then",\
        "the wall drops!",\
        "",\
        "Each team has 2 giant ravagers to protect.",\
        "",\
        "Kill the enemy ravagers first to win!",\
    ]
data modify storage main:intro walls.howtoplay append value \
    [\
        "You spawn with 8 crystals and can earn",\
        "more by killing enemies or evokers (after wall drops).",\
        "",\
        "Buy resources and special weapons from",\
        "villagers at your spawn!",\
        ""\
    ]
data modify storage main:intro walls.howtoplay append value \
    [\
        "Sudden death: 20 minutes after start,",\
        "ravagers will be poisoned.",\
        "",\
        "If the game still doesn't end 10 minutes",\
        "after that, whoever has most health left",\
        "wins."\
    ]


# --- STATS VARIABLES ---
#   assigned-once per-player values used for the outro leaderboard
scoreboard objectives add walls.st.kills dummy
scoreboard objectives add walls.st.cryst dummy


# --- OUTRO LEADERBOARD SLIDES ---
data modify storage main:outro walls.stats set value []
data modify storage main:outro walls.stats append value { \
    objective: "walls.st.kills",\
    name: "Top killers:",\
    sortby: ">",\
    prefix: "",\
    suffix: " kills",\
    numberformat: 0,\
}
data modify storage main:outro walls.stats append value { \
    objective: "walls.st.cryst",\
    name: "Most crystals earned:",\
    sortby: ">",\
    prefix: "",\
    suffix: " 💠",\
    numberformat: 0,\
}
