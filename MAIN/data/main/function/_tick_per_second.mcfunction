# ============================================================
# 
# [[[ UNFINISHED, DONT USE THIS RIGHT NOW ]]]
# 
# This function only runs once per 20 ticks,
# so you can use this to increment/decrement timers
# that are specified in seconds.
#
# You don't HAVE to do this, but it's more human-readable
# to have your timers use seconds as unit, instead of ticks!
# 
# NOTE: The timer restarts every time the server /reloads,
# so there will be desync if you mix and match tick-based
# and seconds-based timers.
# 
# ============================================================



# TODO do stuff



# schedule itself again 20 ticks later
schedule function main:_tick_per_second 20t replace