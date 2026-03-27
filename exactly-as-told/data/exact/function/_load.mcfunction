# ============================================================
# exact:_load
# Called by: minecraft:load
# Executor:  Server
#
# Initializes scoreboards and MAIN intro/outro configuration.
# ============================================================

# --- DECLARE GAME VARIABLES ---
scoreboard objectives add exact.game dummy
scoreboard objectives add exact.config dummy
scoreboard objectives add exact.stats.completed dummy "rounds completed"
scoreboard objectives add exact.stats.deaths dummy "deaths"

# Legacy compatibility objectives used by existing state files.
scoreboard objectives add GLOBAL dummy
scoreboard objectives add GLOBAL.player_in_state dummy
scoreboard objectives add GLOBAL.player_left minecraft.custom:leave_game
scoreboard objectives add GLOBAL.time_alive minecraft.custom:minecraft.time_since_death

scoreboard players set 20 GLOBAL 20
scoreboard players set 60 GLOBAL 60

# Keep old IDs and state constants so existing state files continue to work.
scoreboard players set id exact.config 1
scoreboard players set state.init exact.config -1
scoreboard players set state.lobby exact.config 0
scoreboard players set state.pregame exact.config 1
scoreboard players set state.ingame_run exact.config 22
scoreboard players set state.ingame_pause exact.config 23
scoreboard players set state.postgame exact.config 3

scoreboard players set time.lobby exact.config 3600
scoreboard players set time.pregame exact.config 400
scoreboard players set time.ingame_run exact.config 400
scoreboard players set time.ingame_pause exact.config 100
scoreboard players set time.postgame exact.config 600

bossbar add exact:timer ""
bossbar set exact:timer visible false

scoreboard objectives add exact.Y dummy
scoreboard objectives add exact.color dummy
scoreboard objectives add exact.is_sneaking dummy
scoreboard objectives add exact.sneakcount dummy
team add exact.temp

# --- INTRO ANIMATION AND TEXT ---
data modify storage main:intro exact.camera_starting_coords set value "10060 92 320"
data modify storage main:intro exact.player_starting_coords set value "10060 90 319"

data modify storage main:intro exact.howtoplay set value []
data modify storage main:intro exact.howtoplay append value \
    [\
        "You will be given a new challenge every round.",\
        "Complete the prompt before the timer runs out!",\
        "Players who finish get points based on finish order.",\
        "Failed players are shown at the break between rounds.",\
        "",\
        "There are 15 rounds in total.",\
    ]
data modify storage main:intro exact.howtoplay append value \
    [\
        ["",{text:"How to earn ",color:"yellow",bold:true},"💎",{text:" in this game:",color:"yellow",bold:true}],\
        "+100 to +5💎 for completing each round quickly",\
        "+0💎 if you fail a round",\
        "",\
        "Keep up with the prompts and survive all rounds!",\
        "",\
    ]

# --- OUTRO LEADERBOARD SLIDES ---
data remove storage main:outro exact.stats
data modify storage main:outro exact.stats append value { \
    objective: "exact.stats.completed",\
    name: "Most prompts completed:",\
    sortby: ">",\
    prefix: "",\
    suffix: " clears",\
    numberformat: 0,\
}
data modify storage main:outro exact.stats append value { \
    objective: "exact.stats.deaths",\
    name: "Most deaths:",\
    sortby: ">",\
    prefix: "",\
    suffix: " deaths",\
    numberformat: 0,\
}
