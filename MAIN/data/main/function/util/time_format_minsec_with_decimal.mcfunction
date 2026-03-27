# ============================================================
# Macro argument: {t:999}
# Result:         storage main:api {return:{min:99,sec:99,dec:99}}
#
# A variant of time_format_minsec,
# if you want to be super precise down to 0.05 of a second.
# 
# ============================================================

$scoreboard players set ?api.tick main.temp $(t)

# get total sec (WITHOUT rounding up the number, bc we're showing decimals this time)
scoreboard players operation ?api.sec main.temp = ?api.tick main.temp
scoreboard players operation ?api.sec main.temp /= #20 main.const

# find total min
scoreboard players operation ?api.min main.temp = ?api.sec main.temp
scoreboard players operation ?api.min main.temp /= #60 main.const

# find decimals (1/20 of a second)
scoreboard players operation ?api.dec main.temp = ?api.tick main.temp
scoreboard players operation ?api.dec main.temp %= #20 main.temp
scoreboard players operation ?api.dec main.temp *= #5 main.temp

# return
execute store result storage main:api return.min int 1 run scoreboard players get ?api.min main.temp
execute store result storage main:api return.sec int 1 run scoreboard players get ?api.sec main.temp
execute store result storage main:api return.dec int 1 run scoreboard players get ?api.dec main.temp