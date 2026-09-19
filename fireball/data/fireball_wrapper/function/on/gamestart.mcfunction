# ============================================================
# fireball:on/gamestart
# Called by: main:private/call/gamestart (once)
# Executor:  Server
#
# Runs ONCE: on the tick when superstate changes to 3.
# Full control is handed over to this minigame datapack.
# ============================================================


# --- STATS ---
#   players without a score are left out of the outro leaderboard,
#   so only the people who were here at game start get a row
scoreboard players set @a[tag=!admin] fireball.st.alive 0
scoreboard players set @a[tag=!admin] fireball.st.hits 0


# --- INIT ---
function fireball:api/init



# --- TEAMS ---
#   teammates crowd the same 17 block platform, so they must not be
#   able to shove or hit each other into the lava. fireball:gameplay/finish
#   puts both of these back.


team modify fireball.red displayName "Data"
team modify fireball.red color red
team modify fireball.red prefix {text:"D ",color:"#e83d84",bold:true}
team modify fireball.black displayName "IT"
team modify fireball.black color light_purple
team modify fireball.black prefix {text:"IT ",color:"#cc99ff",bold:true}

#team join fireball.black @a[team=main.it]
#team join fireball.red @a[team=main.data]

# --- START ---
#   everything below fireball:tick selects the ball with @e / @n and
#   those are scoped to the execution dimension, so the nether has to
#   be entered here rather than sprinkled through ball/.
function fireball:api/start

# --- SANITY CHECK ---
#   no centre marker means no ball spawns and no way to win, so say
#   so loudly rather than running a silent stalemate
# warn-off target-selector-no-dimension
execute unless entity @e[tag=fireball.arena_center,type=marker] run tellraw @a[tag=admin] {text:"[fireball] no fireball.arena_center marker found — run /function fireball:setup/create_arena.",color:"red"}
