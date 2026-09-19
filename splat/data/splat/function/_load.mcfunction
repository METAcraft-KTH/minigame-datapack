# ============================================================
# splat:_load
# Called by: minecraft:load
#
# Paint the Campus is implemented by a server-side MOD.
# This datapack only exists to:
#   1. expose a running flag the mod can poll
#   2. supply the intro slides and outro leaderboard to MAIN
# The mod calls main:api/end_game itself when the game is over.
# ============================================================

# --- DECLARE GAME VARIABLES ---
#   ?running splat.state
#       0 = the minigame is NOT active
#       1 = the minigame IS active (superstate 3, mod has control)
#   The mod reads this to know when to run its own game logic.
scoreboard objectives add splat.state dummy "game internal state"

#   make sure the flag exists (and is off) after a fresh /reload
execute unless score ?running splat.state matches -2147483648..2147483647 run scoreboard players set ?running splat.state 0


# --- INTRO ANIMATION AND TEXT ---

#   where to summon the intro camera entity.
#   THIS CAN HAVE YAW/PITCH!
data modify storage main:intro splat.camera_starting_coords set value "0 100 50000"

#   where to teleport all players after the intro ends.
#   MAIN only supports ONE coordinate for everyone, so this is the
#   Data spawn. splat:on/gamestart runs on the same tick and splits
#   the two teams up to their real spawns.
#   THIS CAN HAVE YAW/PITCH!
data modify storage main:intro splat.player_starting_coords set value "-48 63 50070 0 0"

#   how-to-play slides, shown in chat in 10 second intervals.
#   EACH SLIDE IS EXACTLY 6 ROWS!
#   TODO: placeholder text, replace once the mod's rules are final.
data modify storage main:intro splat.howtoplay set value []
data modify storage main:intro splat.howtoplay append value \
    [\
        {text:"Paint the Campus",color:"aqua",bold:1b},\
        "",\
        "Run around the campus and paint the floor",\
        "in your team's colour.",\
        "Painting over the other team's blocks counts too!",\
        "",\
    ]
data modify storage main:intro splat.howtoplay append value \
    [\
        {text:"Placeholder slide",color:"gray",italic:1b},\
        "",\
        "More detailed rules go here once the mod",\
        "is finished.",\
        "",\
        "",\
    ]
data modify storage main:intro splat.howtoplay append value \
    [\
        ["",{text:"How to earn ",color:"yellow",bold:1b},"💎"],\
        "",\
        "+1💎 for each block you paint",\
        "",\
        "The intro ends after this slide fades out!",\
        "",\
    ]


# --- STATS VARIABLES ---
#   ALWAYS USE DUMMY CRITERIA so the game doesnt change values unexpectedly.
#   The mod is responsible for writing into these objectives.
scoreboard objectives add splat.stats.blocks dummy
scoreboard objectives add splat.stats.kills dummy

# --- OUTRO STATS ---
data remove storage main:outro splat.stats
data modify storage main:outro splat.stats append value { \
    objective: "splat.stats.blocks",\
    name: "Most blocks painted:",\
    sortby: ">",\
    prefix: "",\
    suffix: " blocks",\
    numberformat: 0,\
}
data modify storage main:outro splat.stats append value { \
    objective: "splat.stats.kills",\
    name: "Most enemies splatted:",\
    sortby: ">",\
    prefix: "",\
    suffix: " splats",\
    numberformat: 0,\
}
