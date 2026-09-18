# ============================================================
# walls:player/use_coupon
# Called by: walls:on/player/death
# Executor:  The player who died holding a coupon
# ============================================================

clear @s paper[custom_data~{walls_coupon:1b}] 1
#   1 tick instead of 200 — walls:player/tick_dead respawns them next tick
scoreboard players set @s walls.respawn 1
tellraw @s {text:"Your Insta-Respawn Coupon was spent. Back you go.",color:"gold"}
