# ============================================================
# Macro argument: {t:999}
# Returns result: A number in the format MMSS, where MM is
#                 the minute count and SS is seconds.
#                 Get MM by /= #100, get SS by %= #100.
#
# A function for converting ticks into MM:SS,
# mostly for displaying countdowns.
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

# find sec % 60
scoreboard players operation ?api.sec main.temp %= #60 main.const

# return value
scoreboard players operation ?api.min main.temp *= #100 main.const
scoreboard players operation ?api.sec main.temp += ?api.min main.temp

return run scoreboard players get ?api.sec main.temp