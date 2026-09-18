# ============================================================
# walls:on/player/latejoin
# Called by: main:private/call/latejoin
# Executor:  Player who joined after game start
#
# They missed team lock-in, so put them back on the team they
# picked in the lobby and kit them out. Someone without a team
# has nothing to fight for and just spectates.
# ============================================================

execute if score @s main.team matches 1 run team join main.data @s
execute if score @s main.team matches 2 run team join main.it @s

execute unless entity @s[team=main.it] unless entity @s[team=main.data] run gamemode spectator @s
execute unless entity @s[team=main.it] unless entity @s[team=main.data] run tellraw @s {text:"The game is already in progress and you have no team. You are now spectating.",color:"yellow"}
execute unless entity @s[team=main.it] unless entity @s[team=main.data] run return 0

function walls:player/set_spawnpoints
function walls:player/setup
scoreboard players set @s walls.st.kills 0
scoreboard players set @s walls.st.cryst 0
bossbar set walls:it players @a
bossbar set walls:data players @a
bossbar set walls:timer players @a
tellraw @s {text:"You joined mid-game. Here is a starting kit — good luck.",color:"yellow"}
