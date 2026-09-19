# ============================================================
# fireball:_load
# Called by: minecraft:load
# Executor:  Server
#
# Declares objectives, loads the uuid ROM, and hands MAIN the
# intro cutscene / outro leaderboard configuration.
#
# NOTE: no gamerules are touched here. This pack is loaded while
# the lobby is running, and the lobby is not ours to reconfigure.
# fireball:on/gamestart sets them up instead.
# ============================================================




# --- INTRO ANIMATION AND TEXT ---

# The camera looks due south and drifts forward through the whole
# cutscene, so it starts north of the blackstone platform on the
# arena's centre line and flies the length of the lava field:
# IT's platform first, then the middle, then Data's.
#
# 21 blocks above the floor at a 25 degree pitch puts the horizon
# line 45 blocks ahead, which is also roughly how far the camera
# drifts before the last slide fades out.
#
# These are NETHER coordinates, but MAIN summons its camera with a
# bare "tp @a", so the cutscene starts at the overworld copy of them
# and fireball:on/introstart carries it across five ticks later. Keep
# the two identical so the framing survives the move.
data modify storage main:intro fireball.camera_starting_coords set value "0 149 -50 0 25"

# MAIN drops everyone on one coordinate, in the overworld, for the
# single tick before fireball:on/gamestart pulls them into the nether
# and fireball:gameplay/tp_to_arena spreads them onto their platforms.
data modify storage main:intro fireball.player_starting_coords set value "0 129 30 180 0"

data modify storage main:intro fireball.howtoplay set value []
data modify storage main:intro fireball.howtoplay append value \
    [\
        "Hit a fireball back and forth until it explodes!",\
        "",\
        "Left-click with your Fireball Bat to hit it back",\
        "(it gives you 5-block reach).",\
        "",\
        "Fireball explosion takes out the platform too!",\
    ]
data modify storage main:intro fireball.howtoplay append value \
    [\
        "The fireball gets faster every hit",\
        "and targets a random enemy.",\
        "",\
        "If you fall into the lava and die, you're out!",\
        "Last team alive wins!",\
        "",\
    ]


# --- STATS VARIABLES ---
#   assigned-once per-player values used for the outro leaderboard
scoreboard objectives add fireball.st.alive dummy
scoreboard objectives add fireball.st.hits dummy


# --- OUTRO LEADERBOARD SLIDES ---
data modify storage main:outro fireball.stats set value []
data modify storage main:outro fireball.stats append value { \
    objective: "fireball.st.alive",\
    name: "Longest survivors:",\
    sortby: ">",\
    prefix: "",\
    suffix: "",\
    numberformat: 3,\
}
data modify storage main:outro fireball.stats append value { \
    objective: "fireball.st.hits",\
    name: "Most bat hits:",\
    sortby: ">",\
    prefix: "",\
    suffix: " hits",\
    numberformat: 0,\
}
