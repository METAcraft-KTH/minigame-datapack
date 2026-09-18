# ============================================================
# walls:util/gamerules
# Called by: walls:on/gamestart
# Executor:  Server
#
# MAIN's baseline is built for arena games. This is a survival
# game, so most of it has to be turned back on.
# ============================================================

function main:util/reset_gamerules

# mining, crafting and looting are the whole first 10 minutes
gamerule block_drops true
gamerule entity_drops true
gamerule mob_drops true
gamerule random_tick_speed 3
gamerule natural_health_regeneration true

# you keep what you had, and you come back straight away
gamerule keep_inventory true
gamerule immediate_respawn true
gamerule pvp true
#   we print our own kill feed in walls:on/player/death
gamerule show_death_messages false

# the Trickster sells spawners, so the blocks have to work
gamerule spawner_blocks_work true
#   natural spawning stays off — every mob in this game is bought.
#   if placed spawners turn out to be dead, this is the first thing
#   to try flipping.
gamerule spawn_mobs false

# on peaceful the wardens would vanish and the spawners would do nothing
difficulty normal
