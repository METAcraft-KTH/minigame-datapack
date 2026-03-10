# ============================================================
# Macro argument: {t:999}
# Returns result: The amount of seconds, rounded up.
#
# A function for converting ticks into seconds, rounded up.
# Useful if you don't want module 60 for some reason --
# if you DO want that, see time_format_minesec.
# 
# ============================================================

$scoreboard players set ?api.tick main.temp $(t)

# get total sec - we want to round UP the number!
scoreboard players operation ?api.sec main.temp = ?api.tick main.temp
scoreboard players operation ?api.sec main.temp += #19 main.const
scoreboard players operation ?api.sec main.temp /= #20 main.const

return run scoreboard players get ?api.sec main.temp