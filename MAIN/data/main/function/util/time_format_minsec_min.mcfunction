# ============================================================
# Macro argument: {t:999}
# Returns result: The MM part of the MMSS output from
#                 main:util/time_format_minsec.
# 
# ============================================================

$scoreboard players set ?api.tick main.temp $(t)

# get total sec - we want to round UP the number!
scoreboard players operation ?api.sec main.temp = ?api.tick main.temp
scoreboard players operation ?api.sec main.temp += #19 main.const
scoreboard players operation ?api.sec main.temp /= #20 main.const

# find total min
scoreboard players operation ?api.min main.temp = ?api.sec main.temp
scoreboard players operation ?api.min main.temp /= #60 main.const

return run scoreboard players get ?api.min main.temp