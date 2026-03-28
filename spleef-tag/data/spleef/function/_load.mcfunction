# ============================================================
# spleef:_load
# Called by: minecraft:load
# Executor:  Server
#
# Initializes scoreboards and MAIN intro/outro configuration.
# ============================================================

# --- DECLARE GAME VARIABLES ---
scoreboard objectives add spleef.game dummy "game internal state"
scoreboard objectives add spleef.config dummy "game config"
scoreboard objectives add spleef.temp dummy "scratch values"
scoreboard objectives add spleef.Y dummy "player Y"
scoreboard objectives add spleef.blockmined minecraft.used:golden_pickaxe
scoreboard objectives add spleef.diamondmined minecraft.mined:diamond_block
scoreboard objectives add spleef.stats.rounds dummy "rounds survived"

# --- CONFIG VALUES ---
scoreboard players set state.pregame spleef.config 1
scoreboard players set state.ingame_spleef spleef.config 21
scoreboard players set state.ingame_run spleef.config 22
scoreboard players set state.ingame_freeze spleef.config 23

scoreboard players set time.pregame spleef.config 400
scoreboard players set time.ingame_spleef spleef.config 600
scoreboard players set time.ingame_run spleef.config 100
scoreboard players set time.ingame_freeze spleef.config 100

# --- INTRO ANIMATION AND TEXT ---
data modify storage main:intro spleef.camera_starting_coords set value "30024 32 49960"
data modify storage main:intro spleef.player_starting_coords set value "30024 50 50024"

data modify storage main:intro spleef.howtoplay set value []
data modify storage main:intro spleef.howtoplay append value \
    [\
        "This game alternates between Spleef and Musical Chairs!",\
        "",\
        "During Spleef, mine blocks to regain hunger.",\
        "At random, a block will be chosen, and",\
        "you must quickly find and stand",\
        "on the right block.",\
    ]
data modify storage main:intro spleef.howtoplay append value \
    [\
        "If you fall off, you'll only respawn next round.",\
        "There are 13 rounds in total.",\
        "",\
        "The rounds will have more and more colors,",\
        "and less and less time for you to react!",\
        "",\
    ]
data modify storage main:intro spleef.howtoplay append value \
    [\
        ["",{text:"How to earn ",color:"yellow",bold:true},"💎",{text:" in this game:",color:"yellow",bold:true}],\
        "",\
        "+3💎 when someone dies before you",\
        "+30💎 for surviving a round",\
        "Extra +100~10💎 for the top 10 players each round",\
        [" "," "," "," (if N players survive, they all share Nth place)"],\
        "",\
    ]

# --- OUTRO LEADERBOARD SLIDES ---
data remove storage main:outro spleef.stats
data modify storage main:outro spleef.stats append value { \
    objective: "spleef.stats.rounds",\
    name: "Most rounds survived:",\
    sortby: ">",\
    prefix: "",\
    suffix: " rounds",\
    numberformat: 0,\
}
