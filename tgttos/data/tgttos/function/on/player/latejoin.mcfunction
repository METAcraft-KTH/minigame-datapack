# ============================================================
# tgttos:on/player/latejoin
# Called by: main:private/call/latejoin
# Executor:  Player who joined after game start
#
# They missed team lock-in, so put them back on the team they
# picked in the lobby and kit them out. Nothing here is earned,
# so a late joiner is not behind on anything but the clock.
# Someone without a team has nothing to fight for and spectates.
# ============================================================

execute if score @s main.team matches 1 run team join main.data @s
execute if score @s main.team matches 2 run team join main.it @s

execute unless entity @s[team=main.it] unless entity @s[team=main.data] run gamemode spectator @s
execute unless entity @s[team=main.it] unless entity @s[team=main.data] run tellraw @s {text:"The game is already in progress and you have no team. You are now spectating.",color:"yellow"}
execute unless entity @s[team=main.it] unless entity @s[team=main.data] run return 0

function tgttos:player/set_spawnpoints
function tgttos:player/setup
scoreboard players set @s tgttos.st.kills 0
scoreboard players set @s tgttos.st.caps 0
scoreboard players set @s tgttos.st.wool 0
bossbar set tgttos:data players @a
bossbar set tgttos:it players @a
tellraw @s {text:"You joined mid-game. Here is a kit — get out there and bridge.",color:"yellow"}
