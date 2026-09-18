# ============================================================
# tgttos:util/gamerules
# Called by: tgttos:on/gamestart
# Executor:  Server
#
# MAIN's baseline is already close to what this game wants.
# ============================================================

function main:util/reset_gamerules

# you keep the kit, and you are back on your platform instantly:
# a death here is a thirty second walk back over your own bridge,
# which is punishment enough
gamerule keep_inventory true
gamerule immediate_respawn true
gamerule pvp true
#   we print our own kill feed in tgttos:on/player/death
gamerule show_death_messages false

# nothing is mined for profit, and no block in this game drops
gamerule block_drops false
gamerule entity_drops false
#   the whole game is players breaking blocks, so this must stay on
gamerule projectiles_can_break_blocks true
#   Regeneration I is handed out explicitly; natural regen on top of
#   it would make the bow useless
gamerule natural_health_regeneration false
gamerule fall_damage true
