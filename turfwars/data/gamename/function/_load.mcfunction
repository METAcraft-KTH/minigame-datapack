# --- DECLARE GAME VARIABLES ---
scoreboard objectives add tf.state dummy "game internal state"
scoreboard objectives add tf.timer dummy "game internal timer"
scoreboard objectives add tf.temp dummy "scratch values"


# --- INTRO ANIMATION AND TEXT ---

#   this dictates where to summon the camera entity that all players will spectate from.
#       because i'm lazy, the entity is hardcoded to
#       always look due south and move forward at 1 block per second.
#   THIS CAN HAVE YAW/PITCH!
data modify storage main:intro tf.camera_starting_coords set value "10000 100 50000"

#   this dictates where to teleport all players after the intro ends.
#   this is used by main:superstate/2/go_to_state_3.
#   THIS CAN HAVE YAW/PITCH!
data modify storage main:intro tf.player_starting_coords set value "10000 64 50000"

#   this sets the how-to-play messages to display in chat.
#       these are displayed in 10 second intervals, because that's how long
#       it takes for minecraft to fade out a message.
#   EACH SLIDE IS 6 ROWS LONG, SO YOU NEED TO SUPPLY 6 ROWS OF JSON TEXT!
data modify storage main:intro tf.howtoplay set value []
data modify storage main:intro tf.howtoplay append value \
    [\
        "This template uses 3 rounds.",\
        "Each round: 15s ready, 120s play, 30s break.",\
        "",\
        "Actionbar shows each state countdown.",\
        "Gameplay and break loop until round 3 ends.",\
        "",\
    ]
data modify storage main:intro tf.howtoplay append value \
    [\
        "Example advancement triggers are included:",\
        "- player kill trigger",\
        "- consume item trigger",\
        "",\
        "Reward functions run only in gameplay state.",\
        "Round 3 break ending calls main:api/end_game.",\
    ]

# --- STATS VARIABLES ---
#   these are (typically) assigned-once variables used to
#   display personal/leaderboard stats to the players
#   after the game is over.
#   ALWAYS USE DUMMY CRITERIA so the game doesnt change values unexpectedly
scoreboard objectives add tf.stats.kills dummy
scoreboard objectives add tf.stats.trigs dummy
scoreboard objectives add tf.stats.laptime dummy

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
data remove storage main:outro tf.stats
data modify storage main:outro tf.stats append value { \
    objective: "tf.stats.kills",\
    name: "Top killers:",\
    sortby: ">",\
    prefix: "",\
    suffix: " kills",\
    numberformat: 0,\
}
data modify storage main:outro tf.stats append value { \
    objective: "tf.stats.laptime",\
    name: "Fastest laps:",\
    sortby: "<",\
    prefix: "",\
    suffix: "",\
    numberformat: 3,\
}
data modify storage main:outro tf.stats append value { \
    objective: "tf.stats.trigs",\
    name: "Gapple advancement triggers:",\
    sortby: ">",\
    prefix: "",\
    suffix: " triggers",\
    numberformat: 0,\
}