# --- DECLARE GAME VARIABLES ---
scoreboard objectives add uhc.state dummy "game-internal states"
scoreboard objectives add uhc.time dummy "game-internal timer"
scoreboard objectives add uhc.arena dummy
scoreboard objectives add uhc.temp dummy
scoreboard objectives add uhc.flying minecraft.custom:minecraft.aviate_one_cm
# uhc.arena - used to assign marker entities to the correct arena.
#
# ?round uhc.state - The round number that determines the arena to use. In
#                    gamestart this is set to 1.
# ?state uhc.state - The state of the game.
#   0 = in battle bus
#   1 = playing.
#   2 = round ended. When the next round starts, ?state is set back to 0 but
#       ?round is incremented by 1.
# ?timer uhc.time - This is a timer that counts up in ticks. It is reset to 0
#                  at the start of each round, and is used to trigger various
#                  time-based events, such as the end of the grace period and the
#                  start of the world border shrink.
#
# Constants
# ?battlebus_wait_time uhc.time - Ticks to wait before dropping players out of
#                                 the battle bus
scoreboard players set ?battlebus_wait_time uhc.time 200
# ?grace_period_time uhc.time - Ticks to wait before enabling PvP
scoreboard players set ?grace_period_time uhc.time 3600
# ?worldborder_horizontal_shrink_time uhc.time - Ticks to wait before starting to shrink
#                                     the world border. Currently same as above.
scoreboard players set ?worldborder_horizontal_shrink_time uhc.time 3600
# ?worldborder_vertical_shrink_time uhc.time - Ticks to wait before starting to
#                                              the world border vertically
scoreboard players set ?worldborder_vertical_shrink_time uhc.time 7200
# ?wither_spawn_time uhc.time - Ticks to wait before spawning withers.
scoreboard players set ?wither_spawn_time uhc.time 12000
# ?sound_stop_time uhc.time - Ticks when the battle bus sound stops playing.
#                             This is an optimization to avoid having to perform the sound check a lot.
scoreboard players set ?sound_stop_time uhc.time 800
# ?num_rounds uhc.state - The total number of rounds to play before the game ends.
scoreboard players set ?num_rounds uhc.state 2
# ?round_delay_time uhc.time - The number of ticks to wait between rounds.
scoreboard players set ?round_delay_time uhc.time 2400


# --- Bossbar ---
bossbar add uhc:bossbar ""
bossbar set uhc:bossbar visible false

# --- Teams ---
team add uhc.grace_period
team modify uhc.grace_period friendlyFire false

# --- STATS VARIABLES ---
#   these are (typically) assigned-once variables used to
#   display personal/leaderboard stats to the players
#   after the game is over.



# --- INTRO ANIMATION AND TEXT ---

#   this dictates where to summon the camera entity that all players will spectate from.
#       because i'm lazy, the entity is hardcoded to
#       always look due south and move forward at 0.2 blocks per second.
data modify storage main:intro uhc.camera_starting_coords set value "20000 100 50000"

#   this dictates where to teleport all players after the intro ends.
#   this is used by main:superstate/2/go_to_state_3.
#   THIS CAN HAVE YAW/PITCH!
data modify storage main:intro uhc.player_starting_coords set value "20000 64 50000"

#   this sets the how-to-play messages to display in chat.
#       these are displayed in 10 second intervals, because that's how long
#       it takes for minecraft to fade out a message.
#   EACH SLIDE IS 6 ROWS LONG, SO YOU NEED TO SUPPLY 6 ROWS OF JSON TEXT!
data modify storage main:intro uhc.howtoplay set value []
data modify storage main:intro uhc.howtoplay append value \
    [\
        ["",{text:"How to play ",color:"yellow",bold:1b}],                         \
        ["1. Gather gear", {text:" (3 minute grace period)", color: "gray"}],                  \
        "2. Kill others",                                                                             \
        "3. Watch out for the decreasing world border",                                                  \
        "4. Be the last one standing",                                                    \
        ""                                                                              \
    ]
data modify storage main:intro uhc.howtoplay append value \
    [\
        ["",{text:"How to earn ",color:"yellow",bold:1b},"💎"],                         \
        "+XXX💎 for each kill",                                       \
        "+XXX💎 for being in the top XXX",                                            \
        "",                                                                             \
        ["Kills also give you a ", {text:"Golden Head", color: "gold"}, " that"],                   \
        ["instantly gives you 4", {text:"B",font:"uhc:font"}, " and 6", {text:"A",font:"uhc:font"}, " over 30 seconds"],                               \
    ]
data modify storage main:intro uhc.howtoplay append value \
    [\
        ["",{text:"Choose your landing spot ",color:"yellow",bold:1b}],                         \
        "Avoid other players by flying somewhere empty!",                                       \
        "",                                            \
        "The elytra disappears when you hit the ground.",                                                                             \
        "",                   \
        "PvP is enabled in three minutes, good luck!",                               \
    ]