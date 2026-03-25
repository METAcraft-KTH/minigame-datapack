# --- DECLARE GAME VARIABLES ---
scoreboard objectives add uhc.state dummy "game-internal states"

# --- STATS VARIABLES ---
#   these are (typically) assigned-once variables used to
#   display personal/leaderboard stats to the players
#   after the game is over.



# --- INTRO ANIMATION AND TEXT ---

#   this dictates where to summon the camera entity that all players will spectate from.
#       because i'm lazy, the entity is hardcoded to
#       always look due south and move forward at 0.2 blocks per second.
data modify storage main:intro uhc.camera_starting_coords set value "10000 100 50000"

#   this dictates where to teleport all players after the intro ends.
#   this is used by main:superstate/2/go_to_state_3.
#   THIS CAN HAVE YAW/PITCH!
data modify storage main:intro uhc.player_starting_coords set value "10000 64 50000"

#   this sets the how-to-play messages to display in chat.
#       these are displayed in 10 second intervals, because that's how long
#       it takes for minecraft to fade out a message.
#   EACH SLIDE IS 6 ROWS LONG, SO YOU NEED TO SUPPLY 6 ROWS OF JSON TEXT!
data modify storage main:intro uhc.howtoplay set value []
data modify storage main:intro uhc.howtoplay append value \
    [\
        "In this game, you do this and that.",                                          \
        {text:"You can also use any kind of JSON text!",color:"blue"},                  \
        "",                                                                             \
        "Another row of text here...",                                                  \
        "Have you tried not dying?",                                                    \
        ""                                                                              \
    ]
data modify storage main:intro uhc.howtoplay append value \
    [\
        ["",{text:"How to earn ",color:"yellow",bold:1b},"💎"],                         \
        "+4💎 for each death while you're alive",                                       \
        "+25💎 for each kill caused by you",                                            \
        "",                                                                             \
        "It's courtesy to have the last slide be how scoring works.",                   \
        "The intro ends after the last slide fades out!",                               \
    ]