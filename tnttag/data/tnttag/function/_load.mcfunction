# --- DECLARE GAME VARIABLES ---
scoreboard objectives add tnttag.state dummy "game-internal states"
scoreboard objectives add tnttag.timer dummy "game-internal timer"
scoreboard objectives add tnttag.temp dummy


# --- Bossbar ---
bossbar add tnttag:white ""
bossbar set tnttag:white visible false
bossbar add tnttag:red ""
bossbar set tnttag:red color red
bossbar set tnttag:red visible false
bossbar add tnttag:blue ""
bossbar set tnttag:blue color blue
bossbar set tnttag:blue visible false

# --- Teams ---
team add tnttag.has_tnt
team modify tnttag.has_tnt color red
team modify tnttag.has_tnt prefix [{text:"[TNT] ",color:"white"}]
team add tnttag.has_diamond
team modify tnttag.has_diamond color aqua
team modify tnttag.has_diamond prefix [{text:"[$$$] ",color:"white"}]

# --- STATS VARIABLES ---
#   these are (typically) assigned-once variables used to
#   display personal/leaderboard stats to the players
#   after the game is over.



# --- INTRO ANIMATION AND TEXT ---

#   this dictates where to summon the camera entity that all players will spectate from.
#       because i'm lazy, the entity is hardcoded to
#       always look due south and move forward at 0.2 blocks per second.
data modify storage main:intro tnttag.camera_starting_coords set value "19958 24 60073"

#   this dictates where to teleport all players after the intro ends.
#   this is used by main:superstate/2/go_to_state_3.
#   THIS CAN HAVE YAW/PITCH!
data modify storage main:intro tnttag.player_starting_coords set value "19958 24 60073"

#   this sets the how-to-play messages to display in chat.
#       these are displayed in 10 second intervals, because that's how long
#       it takes for minecraft to fade out a message.
#   EACH SLIDE IS 6 ROWS LONG, SO YOU NEED TO SUPPLY 6 ROWS OF JSON TEXT!
data modify storage main:intro tnttag.howtoplay set value []
data modify storage main:intro tnttag.howtoplay append value \
    [\
        "At the start of each round, some players will",\
        "receive TNT that they must give away.",\
        "",\
        "When the round ends, all TNT will explode,",\
        "killing anyone who is still holding them!",\
        "",\
    ]
data modify storage main:intro tnttag.howtoplay append value \
    [\
        "Every 5 rounds, you must also evacuate to a new arena.",\
        "Follow the red beacon for where to go!",\
        "",\
        "Diamond blocks give extra 💎 on round end.",\
        "Punch those players to steal the block from them!",\
        "",\
    ]
data modify storage main:intro tnttag.howtoplay append value \
    [\
        ["",{text:"How to earn ",color:"yellow",bold:1b},"💎"],\
        "+25💎 per round survived",\
        "+50💎 if you were holding a diamond block",\
        "+25💎 per successful evacuation",\
        "",\
        "For each new arena, +10💎 for above categories",\
    ]