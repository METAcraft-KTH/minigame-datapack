# ============================================================
# 
# This function always runs on /reload.
# 
# ============================================================

# --- GLOBAL VARIABLES ---
scoreboard objectives add main.const dummy "Constants, global configs"
scoreboard objectives add main.state dummy "Variables, global states"
scoreboard objectives add main.time dummy "Timer-related variables"
scoreboard objectives add main.id dummy "Unique IDs for every player"
scoreboard objectives add main.iwashere dummy "Check if player was online at game start"
scoreboard objectives add main.temp dummy "Any temporary calculations"
scoreboard objectives add main.temp.stat dummy "For holding per-player stats in outros"

# --- DEFAULT VARIABLE STATES ---
#
# ?superstate main.state  --- what state is the entire event in?
#   0 = KICKOFF             waiting for people to join
#   1 = INTERMISSION        hanging in the lobby while waiting for the next game
#   2 = GAME OPENING        intro sequence
#   3 = GAME INGAME         hand it off to the minigame datapack
#   4 = GAME CLOSING        outro animations if applicable) (go back to 1 if not the final game
#   5 = EVENT END
#       for the sake of giving games full control over itself, anything that happens during
#       the actual gameplay part is inside superstate 3.
# 
# ?minigame_id main.state --- what game is ongoing? (for states 1-4 only)
#   0   = NONE          (state 0 or 5, not that it matters lol)
#   1-6 = corresponding game
#
execute unless score ?superstate main.state matches -2147483648..2147483647 run scoreboard players set ?superstate main.state 0
execute unless score ?minigame_id main.state matches -2147483648..2147483647 run scoreboard players set ?minigame_id main.state 0
# if this is the first time the datapack is run, set the first ID to 1 and increment it per player
execute unless score ! main.id matches -2147483648..2147483647 run scoreboard players set ! main.id 1


# --- GAME NAMES ---
#   used to call each game's api functions, and to generate the title.
#   first object is empty because i'm 1-indexing.
#   i would've liked to have so that every game registers its own name,
#   but it's more convenient to be able to reorder them whenever.
data merge storage main:game {display:[{}, \
    {id:1,namespace:"race",gamename:"Race Around The World"}, \
    {id:2,namespace:"uhc",gamename:"UHC Done Quick"}, \
    {id:3,namespace:"spleef",gamename:"Hela Havet Spleefar"}, \
    {id:4,namespace:"kotm",gamename:"King of the Mingle"}, \
    {id:5,namespace:"exact",gamename:"Exactly As Told"}, \
    {id:6,namespace:"qq",gamename:"One in the Quiver"}, \
]}


# --- BOSSBARS ---
bossbar add main:timer ""


# --- CONFIGS ---
#   how many players to wait for, before we start counting down towards the first minigame
scoreboard players set ?launch_wait_for_player_count main.const 15
#   how long we should wait before the first minigame, in ticks, after the minimum player count is met
scoreboard players set ?before_first_minigame_wait_time main.const 14400
#   how long lobby intermissions between minigames should last, in ticks
scoreboard players set ?intermission_length main.const 2400

# --- CONSTS ---
#   for all kinds of scoreboard players operations you might need
scoreboard players set #-1 main.const -1
scoreboard players set #0 main.const 0
scoreboard players set #1 main.const 1
scoreboard players set #2 main.const 2
scoreboard players set #3 main.const 3
scoreboard players set #4 main.const 4
scoreboard players set #5 main.const 5
scoreboard players set #10 main.const 10
scoreboard players set #19 main.const 19
scoreboard players set #20 main.const 20
scoreboard players set #50 main.const 50
scoreboard players set #60 main.const 60
scoreboard players set #100 main.const 100
scoreboard players set #120 main.const 120
scoreboard players set #200 main.const 200

# --- SCHEDULE _tick_per_second ---
#schedule function main:_tick_per_second 20t replace


# --- EVENT DETECTION ---
#   player disconnect
scoreboard objectives add main.disconnect minecraft.custom:leave_game
#   player death
scoreboard objectives add main.death deathCount