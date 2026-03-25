# ============================================================
# Called by: main:private/call/rejoin
# Executor:  Player who rejoined the server
# 
# Triggers on rejoin, regardless of when
# they disconnected.
# INCLUDING FIRST-TIME JOINERS!
# 
# If you want to only target late joiners, filter:
#       unless score @s main.iwashere matches 1
# But, it's better to do it in the latejoin function,
# because both this and latejoin will run at the same time
# if it is a late join.
# 
# ============================================================