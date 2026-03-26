# ============================================================
# Macro argument: {t:999}
# Result:         Storage main:api {return:{min:99,sec:99}}
#
# A function for converting ticks into MM:SS,
# mostly for displaying countdowns.
# This function ROUNDS UP the second because it doesn't
# show decimals!
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

# return
execute store result storage main:api return.min int 1 run scoreboard players get ?api.min main.temp
execute store result storage main:api return.sec int 1 run scoreboard players get ?api.sec main.temp