# --- DECLARE GAME VARIABLES ---
scoreboard objectives add gamename.state dummy "game-internal states"


# --- INTRO ANIMATION AND TEXT ---

#   this dictates where to summon the camera entity that all players will spectate from.
#       because i'm lazy, the entity is hardcoded to
#       always look due south and move forward at 0.2 blocks per second.
#   THIS CAN HAVE YAW/PITCH!
data modify storage main:intro gamename.camera_starting_coords set value "10000 100 50000"

#   this dictates where to teleport all players after the intro ends.
#   this is used by main:superstate/2/go_to_state_3.
#   THIS CAN HAVE YAW/PITCH!
data modify storage main:intro gamename.player_starting_coords set value "10000 64 50000"

#   this sets the how-to-play messages to display in chat.
#       these are displayed in 10 second intervals, because that's how long
#       it takes for minecraft to fade out a message.
#   EACH SLIDE IS 6 ROWS LONG, SO YOU NEED TO SUPPLY 6 ROWS OF JSON TEXT!
data modify storage main:intro gamename.howtoplay set value []
data modify storage main:intro gamename.howtoplay append value \
    [\
        "In this game, you do this and that.",\
        {text:"You can also use any kind of JSON text!",color:"blue"},\
        "",\
        "Another row of text here...",\
        "Have you tried not dying?",\
        "",\
    ]
data modify storage main:intro gamename.howtoplay append value \
    [\
        ["",{text:"How to earn ",color:"yellow",bold:1b},"💎"],\
        "+4💎 for each death while you're alive",\
        "+25💎 for each kill caused by you",\
        "",\
        "It's courtesy to have the last slide be how scoring works.",\
        "The intro ends after the last slide fades out!",\
    ]

# --- STATS VARIABLES ---
#   these are (typically) assigned-once variables used to
#   display personal/leaderboard stats to the players
#   after the game is over.
#   ALWAYS USE DUMMY CRITERIA so the game doesnt change values unexpectedly
scoreboard objectives add gamename.stats.kills dummy
scoreboard objectives add gamename.stats.laptime dummy

# --- OUTRO STATS ---
#   defines which scoreboard objectives to pull numbers from,
#   the sorting to apply,
#       > = biggest first
#       < = smallest first
#   and the number format to use.
#       0 = do not format the number
#       1 = format from tick to    ss with    decimals
#       2 = format from tick to mm:ss without decimals
#       3 = format from tick to mm:ss with    decimals
data modify storage main:outro gamename.stats append value { \
    objective: "gamename.stat.kills",\
    name: "Top killers:",\
    sortby: ">",\
    prefix: "",\
    suffix: " kills",\
    numberformat: 0,\
}
data modify storage main:outro gamename.stats append value { \
    objective: "gamename.stat.laptime",\
    name: "Fastest laps:",\
    sortby: "<",\
    prefix: "",\
    suffix: "",\
    numberformat: 3,\
}