# ============================================================
# fireball:on/gamestart
# Called by: main:private/call/gamestart (once)
# Executor:  Server
#
# Runs ONCE: on the tick when superstate changes to 3.
# Full control is handed over to this minigame datapack.
# ============================================================

# --- GAMERULES ---
#   MAIN's baseline is already what this game wants: block_drops off
#   (so ball/explode's "fill ... destroy" does not carpet the lava in
#   floating nether brick), immediate_respawn on, keep_inventory on,
#   and our own death messages.
function main:util/reset_gamerules

# --- TEAMS ---
#   teammates crowd the same 17 block platform, so they must not be
#   able to shove or hit each other into the lava. fireball:gameplay/finish
#   puts both of these back.
team modify main.data friendlyFire false
team modify main.data collisionRule pushOtherTeams
team modify main.it friendlyFire false
team modify main.it collisionRule pushOtherTeams

# --- STATS ---
#   players without a score are left out of the outro leaderboard,
#   so only the people who were here at game start get a row
scoreboard players set @a[tag=!admin] fireball.st.alive 0
scoreboard players set @a[tag=!admin] fireball.st.hits 0

# --- START ---
function fireball:api/start

# --- SANITY CHECK ---
#   no centre marker means no ball spawns and no way to win, so say
#   so loudly rather than running a silent stalemate
execute store result score #n temp if entity @e[type=marker,tag=fireball.arena_center]
execute unless score #n temp matches 1.. run tellraw @a[tag=admin] {text:"[fireball] no fireball.arena_center marker found — run /function fireball:setup/create_arena.",color:"red"}
