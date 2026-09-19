# ============================================================
# fireball:gameplay/init_player
# Called by: fireball:api/start, fireball:on/player/rejoin
# Executor:  Player to put into play
#
# Idempotent — a reconnecting player runs this again.
# ============================================================

tag @s add fireball.alive

clear @s blaze_rod
function fireball:give_bat

gamemode adventure @s
