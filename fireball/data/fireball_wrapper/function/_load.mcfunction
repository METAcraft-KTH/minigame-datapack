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
        "A fireball hunts down the nearest player. Hit it back.",\
        ["",{text:"Data",color:"#e83d84"}," starts on the red nether brick platform,"],\
        ["",{text:"IT",color:"#cc99ff"}," on the blackstone one. Everything between is lava."],\
        "",\
        "Left-click the fireball with your Fireball Bat to send it away.",\
        "The bat reaches 5 blocks, so you don't have to hug it.",\
    ]
data modify storage main:intro fireball.howtoplay append value \
    [\
        ["",{text:"Every hit makes it faster.",color:"yellow",bold:true}],\
        "It also picks a new target, usually someone on the other team.",\
        "",\
        "If it touches a player it explodes and takes the floor with it.",\
        "Bounce it off the ground three times and it explodes anyway.",\
        "More fireballs join the arena the longer the game runs.",\
    ]
data modify storage main:intro fireball.howtoplay append value \
    [\
        "Fall in the lava and you are out. Mind the holes.",\
        "Dead players spectate from the middle until the game ends.",\
        "",\
        ["",{text:"Last team standing wins.",color:"gold",bold:true}],\
        "Afterwards we rank everyone by survival time and bat hits.",\
        "The game starts 10 seconds after this slide fades out. Good luck!",\
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
