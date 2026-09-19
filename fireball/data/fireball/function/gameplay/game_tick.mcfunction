# ============================================================
# fireball:gameplay/game_tick
# Called by: fireball:tick (while #game_time is 1 or more)
# Executor:  Server
#
# The actual game loop. Deaths are NOT polled here — MAIN calls
# fireball:on/player/death for us, which covers lava and the void
# as well as the explosions.
# ============================================================

# warn-off-file execute-group
scoreboard players add #game_time fireball 1

## survival time, for the outro leaderboard.
##   the same predicate the fireball hunts with, so the moment a
##   player is put into spectator their clock stops on its own.
scoreboard players add @a[predicate=fireball:valid_target] fireball.st.alive 1

## end game when only one team stands
execute if score #2teams fireball matches 1 unless entity @a[predicate=fireball:valid_target,team=main.it] run return run function fireball:gameplay/victory_data
execute if score #2teams fireball matches 1 unless entity @a[predicate=fireball:valid_target,team=main.data] run return run function fireball:gameplay/victory_it

## end game when no one stands
execute unless entity @a[predicate=fireball:valid_target] run return run function fireball:gameplay/game_over

## 10 seconds of grace before the first ball. The countdown spawns
## it on its last tick, which is also what seeds #fireball_spawntime.
execute if score #game_time fireball matches ..200 run return run function fireball:gameplay/countdown

## spawn fireball
##   one every 5s up to six balls in the air, then one every 10s
scoreboard players add #fireball_spawntime fireball 1
execute if score #fireball_count fireball matches ..5 if score #fireball_spawntime fireball matches 100.. run function fireball:gameplay/spawn_new_ball
execute unless score #fireball_count fireball matches ..5 if score #fireball_spawntime fireball matches 200.. run function fireball:gameplay/spawn_new_ball
