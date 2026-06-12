# ============================================================
# tf:_load
# Called by: minecraft:load
# Executor:  Server
#
# Initializes scoreboards and MAIN intro/outro configuration.
# ============================================================

# --- DECLARE GAME VARIABLES ---
scoreboard objectives add tf.state dummy "game internal state"
scoreboard objectives add tf.timer dummy "game internal timer"
scoreboard objectives add tf.temp dummy "scratch values"
scoreboard objectives add tf.x dummy "player's X coordinate"
scoreboard objectives add tf.bounce_cd dummy "player's bounce cooldown"
# teams
team add tf.red "[Red]"
team add tf.blue "[Blue]"
bossbar add tf:blue "Blue turf"
bossbar set tf:blue color blue
bossbar set tf:blue style notched_10
bossbar add tf:red "Red turf"
bossbar set tf:red color red
bossbar set tf:red style notched_10

# --- CONFIG VALUES ---
scoreboard players set phase.pregame tf.temp 0
scoreboard players set phase.ingame_run tf.temp 1
scoreboard players set phase.ingame_wait tf.temp 2
scoreboard players set time.pregame tf.temp 400
scoreboard players set time.ingame_run tf.temp 900
scoreboard players set time.ingame_wait tf.temp 600
scoreboard players set cp.radius tf.temp 4

# --- INTRO ANIMATION AND TEXT ---
data modify storage main:intro tf.camera_starting_coords set value "31000 67 59970"
data modify storage main:intro tf.player_starting_coords set value "31000 65 59994"

data modify storage main:intro tf.howtoplay set value []
data modify storage main:intro tf.howtoplay append value \
    [\
        "This is a team PVP game, Red vs Blue!",\
        "You'll be randomly assigned to a team.",\
        "",\
        "On each kill, you'll push your turf towards the enemy spawn.",\
        "",\
        "Whoever takes all the turf wins the match.",\
    ]
data modify storage main:intro tf.howtoplay append value \
    [\
        "The game alternates between two phases:",\
        "",\
        ["In the ",{text:"build phase",color:"light_purple"}," no PVP is allowed."],\
        "You can only build and break blocks on your turf.",\
        ["In the ",{text:"PVP phase",color:"yellow"},", kill to earn turf!"],\
        "For each new PVP phase, you'll earn more turf per kill!",\
    ]
data modify storage main:intro tf.howtoplay append value \
    [\
        ["",{text:"How to earn ",color:"yellow",bold:true},"💎",{text:" in this game:",color:"yellow",bold:true}],\
        "",\
        "+15💎 per kill (by you)",\
        "+3💎 per kill (by a teammate)",\
        "+100💎 if your team wins the match",\
        {text:"2 matches are played. Teams shuffle after match 1.",color:"gray"},\
    ]