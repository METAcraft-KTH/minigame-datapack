# ============================================================
# tgttos:player/tick
# Called by: tgttos:_tick
# Executor:  Server
# ============================================================

# --- INFINITE CONCRETE ---
#   the stack in either hand is put back to 64 every tick, so
#   bridging never runs out and the count never has to be watched
execute as @a[team=main.data,tag=!admin,gamemode=adventure] if items entity @s weapon.mainhand minecraft:pink_concrete run item modify entity @s weapon.mainhand tgttos:refill_concrete
execute as @a[team=main.data,tag=!admin,gamemode=adventure] if items entity @s weapon.offhand minecraft:pink_concrete run item modify entity @s weapon.offhand tgttos:refill_concrete
execute as @a[team=main.it,tag=!admin,gamemode=adventure] if items entity @s weapon.mainhand minecraft:light_blue_concrete run item modify entity @s weapon.mainhand tgttos:refill_concrete
execute as @a[team=main.it,tag=!admin,gamemode=adventure] if items entity @s weapon.offhand minecraft:light_blue_concrete run item modify entity @s weapon.offhand tgttos:refill_concrete

# --- OUT OF BOUNDS ---
execute as @a[tag=!admin,gamemode=adventure] run function tgttos:player/check_void
