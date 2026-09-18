# ============================================================
# exact:state/ingame_task/check_cutoff
# Called by: exact:state/ingame_task/win (whenever someone finishes)
# Executor:  Player who just finished (not used)
#
# Once ?cutoff percent of the players have finished, cut the round
# short to 3 seconds remaining. Never extends a round: if under 3
# seconds are left already, this does nothing.
# ============================================================

# Compare done/total against ?cutoff/100 without dividing:
#   done * 100 >= total * cutoff
# Eliminated players are out of the count -- they can never finish, so
# leaving them in would stop the cutoff from ever being reached.
execute store result score #cut_done exact.state if entity @a[tag=!admin,tag=exact.win]
execute store result score #cut_need exact.state if entity @a[tag=!admin,tag=!exact.dead]

# Nobody has finished: bail out before 0 >= 0 fires on an empty server
execute if score #cut_done exact.state matches ..0 run return 0

scoreboard players operation #cut_done exact.state *= #100 main.const
scoreboard players operation #cut_need exact.state *= ?cutoff exact.state
execute unless score #cut_done exact.state >= #cut_need exact.state run return 0

# Skip to 3 seconds remaining (400 tick round minus 60 ticks).
# Already past that point? Leave the timer alone.
execute unless score ?phase_timer exact.timer matches ..339 run return 0
scoreboard players set ?phase_timer exact.timer 340

tellraw @a [{"text":"Enough players finished — ","color":"yellow"},{"text":"3 seconds left!","color":"red","bold":true}]
