# ============================================================
# exact:util/catchup
# Called by: exact:on/player/rejoin, exact:on/player/latejoin
# Executor:  Player who just (re)joined during superstate 3
#
# Being offline is not a way to dodge the elimination: docks one
# heart for every round that was settled while the player was
# away, then marks them as caught up.
# ============================================================

# No exact.lastround at all means this player has not been enrolled yet.
# The join handlers call exact:util/enroll first, so this should not happen --
# bail out rather than charge somebody who is not in the game.
execute unless score @s exact.lastround matches -2147483648..2147483647 run return 0

# Already out of the game -- nothing left to take.
execute if entity @s[tag=exact.dead] run return 0

# How many rounds have been settled so far. A round only counts once its
# result is in, which is the moment the wait phase starts (?phase 2); during
# the task phase the current round is still up for grabs.
scoreboard players operation #settled exact.state = ?round exact.state
execute unless score ?phase exact.state matches 2 run scoreboard players remove #settled exact.state 1

scoreboard players operation #missed exact.state = #settled exact.state
scoreboard players operation #missed exact.state -= @s exact.lastround
scoreboard players operation @s exact.lastround = #settled exact.state

execute if score #missed exact.state matches ..0 run return 0

tellraw @s [{"text":"You were away for ","color":"red"},{"score":{"name":"#missed","objective":"exact.state"},"color":"red","bold":true},{"text":" round(s) -- that is one heart each.","color":"red"}]

# One heart is two points of health
scoreboard players operation #missed exact.state *= #2 main.const
execute store result storage exact:temp hearts int 1 run scoreboard players get #missed exact.state
function exact:util/catchup_damage with storage exact:temp
