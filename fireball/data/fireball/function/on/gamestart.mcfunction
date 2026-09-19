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

# --- DIMENSION ---
#   main:superstate/2/go_to_state_3 ran "tp @a" and "spawnpoint @a"
#   in the overworld a few commands ago, so right now everybody is
#   standing at the overworld copy of player_starting_coords with an
#   overworld respawn point. fireball:api/start pulls them into the
#   nether below. Move the respawn point too, or every elimination
#   bounces the victim through an overworld loading screen and back
#   before fireball:on/player/death can put them in spectator.
#
#   Data's platform, because it is solid ground — the arena centre
#   they end up spectating from is lava.
execute in minecraft:the_nether run spawnpoint @a[tag=!admin] 0 129 30 180

#   go_to_state_3 tried to clean up the cutscene camera with an
#   overworld-scoped "kill @e[type=block_display,tag=main.camera]",
#   which missed the one fireball:on/introstart moved to the nether.
execute in minecraft:the_nether run kill @e[type=block_display,tag=main.camera]

# --- START ---
#   everything below fireball:tick selects the ball with @e / @n and
#   those are scoped to the execution dimension, so the nether has to
#   be entered here rather than sprinkled through ball/.
execute in minecraft:the_nether run function fireball:api/start

# --- SANITY CHECK ---
#   no centre marker means no ball spawns and no way to win, so say
#   so loudly rather than running a silent stalemate
execute in minecraft:the_nether store result score #n temp if entity @e[type=marker,tag=fireball.arena_center]
execute unless score #n temp matches 1.. run tellraw @a[tag=admin] {text:"[fireball] no fireball.arena_center marker found — run /function fireball:setup/create_arena.",color:"red"}
