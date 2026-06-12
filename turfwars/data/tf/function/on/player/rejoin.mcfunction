# ============================================================
# tf:on/player/rejoin
# Called by: main:private/call/rejoin
# Executor:  Player who rejoined the server
# ============================================================

#execute unless score @s main.iwashere matches 1 run return 0

team leave @s
execute store result score .red tf.temp if entity @a[team=tf.red]
execute store result score .blue tf.temp if entity @a[team=tf.blue]
execute if score .red tf.temp <= .blue tf.temp run team join tf.red @s
execute if score .red tf.temp > .blue tf.temp run team join tf.blue @s

tp @s[team=tf.red] 31075 72 59995 90 0
tp @s[team=tf.blue] 30924 72 59995 -90 0
gamemode adventure @s