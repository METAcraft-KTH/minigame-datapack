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
scoreboard objectives add spleef.hastnt dummy "has tnt"
scoreboard objectives add spleef.blockmined minecraft.used:golden_pickaxe
scoreboard objectives add spleef.stats.rounds dummy "rounds survived"

# --- CONFIG VALUES ---
scoreboard players set state.pregame spleef.config 1
scoreboard players set state.ingame_spleef spleef.config 21
scoreboard players set state.ingame_run spleef.config 22
scoreboard players set state.ingame_freeze spleef.config 23
scoreboard players set state.postgame spleef.config 3

scoreboard players set time.pregame spleef.config 400
scoreboard players set time.ingame_spleef spleef.config 600
scoreboard players set time.ingame_run spleef.config 100
scoreboard players set time.ingame_freeze spleef.config 100

# --- INTRO ANIMATION AND TEXT ---
data modify storage main:intro spleef.camera_starting_coords set value "50023 40 23"
data modify storage main:intro spleef.player_starting_coords set value "50023 32 23"

data modify storage main:intro spleef.howtoplay set value []
data modify storage main:intro spleef.howtoplay append value \
    [\
        "Hela Havet Spleefar + Tag",\
        "Mine floors to stay alive.",\
        "Falling into the void eliminates you for the round.",\
        "In TNT Tag rounds, pass TNT before it explodes.",\
        "Last survivors earn bonus points.",\
        "",\
    ]
data modify storage main:intro spleef.howtoplay append value \
    [\
        "Round cycle:",\
        "1) Spleef phase",\
        "2) Find the matching color",\
        "3) Freeze + scoring",\
        "",\
        "After the final round, MAIN handles the outro.",\
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

# Arena anchor marker
execute positioned 50023 32 23 unless entity @n[type=marker,tag=spleef.tp.arena,distance=..1] run summon marker ~ ~ ~ {Tags:["spleef.tp.arena"]}