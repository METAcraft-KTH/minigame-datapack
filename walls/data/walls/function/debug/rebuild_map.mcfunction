# ============================================================
# walls:debug/rebuild_map
# Run by hand: function walls:debug/rebuild_map
# Executor:  Anyone
#
# Force-loads the arena and replaces the ravagers and shop
# villagers, for when you want to test the map entities without
# running a whole intro. Normally walls:on/introstart does this.
# ============================================================

forceload add 29872 59872 29999 59999
forceload add 29872 60000 29999 60127
forceload add 30000 59872 30127 59999
forceload add 30000 60000 30127 60127

# disarm the win check first, or killing the old ravagers hands
# somebody the match
scoreboard players set ?ready walls.state 0
kill @e[type=ravager,tag=walls.tower]
kill @e[type=armor_stand,tag=walls.tower_anchor]
#   leftovers from the warden and iron golem versions of this pack
kill @e[type=warden,tag=walls.warden]
kill @e[type=iron_golem,tag=walls.golem]
kill @e[type=villager,tag=walls.shop]

tellraw @a {text:"[walls] arena force-loaded. Rebuilding ravagers and shops in 1 second...",color:"yellow"}
schedule function walls:map/setup 20t replace
