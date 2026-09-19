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
#   commented out custom death messages in walls:on/player/death
gamerule show_death_messages true

# the Trickster sells spawners, so the blocks have to work.
#   this is not what arms them: minecraft:spawner is an operator block,
#   so the shop item cannot carry its own block entity data. The mob is
#   written in by walls:spawner/place after the block goes down.
gamerule spawner_blocks_work true
#   natural spawning is on for vanilla survival parity
gamerule spawn_mobs true

# on peaceful the bought spawners would do nothing and mobs would vanish
difficulty normal
