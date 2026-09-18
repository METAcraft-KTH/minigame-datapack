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
        "Two teams, one map, split down the middle by a bedrock wall.",\
        ["",{text:"IT",color:"#cc99ff"}," spawns on the west edge, ",{text:"Data",color:"#e83d84"}," on the east edge."],\
        "",\
        "Each team is guarded by 2 giant ravagers, one per corner.",\
        "They cannot move, but they hit very hard.",\
        "Their shared health is shown in the bar above your hotbar.",\
    ]
data modify storage main:intro walls.howtoplay append value \
    [\
        ["",{text:"The wall drops after 10 minutes.",color:"yellow",bold:true}],\
        "Until then you cannot reach the enemy — mine, craft and gear up.",\
        "",\
        "Three villagers at your spawn trade for prismarine crystals.",\
        "You start with 8. Every kill you get is worth 5 more.",\
        "A giant evoker lands in the middle every 3 minutes, worth 15.",\
    ]
data modify storage main:intro walls.howtoplay append value \
    [\
        ["",{text:"How to earn ",color:"yellow",bold:true},"💎",{text:" in this game:",color:"yellow",bold:true}],\
        "",\
        "+5💎 for every enemy you kill",\
        "+25💎 for landing the final hit on the evoker",\
        "+150💎 for everyone on the winning team",\
        "Kill both enemy ravagers to win!",\
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
