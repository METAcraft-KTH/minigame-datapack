# This function is called when the tagging phase starts.
scoreboard players set ?state ttag.game 21

# initialize timer
execute store result bossbar ttag:timer max run scoreboard players get time.ingame_tag ttag.config
scoreboard players set ?timer ttag.game 0

bossbar set ttag:timer color red

# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1
execute as @a[tag=!admin] run function ttag:states/ingame_tag/reset_player

# increment round counter
scoreboard players add ?round ttag.game 1

# give out TNT based on % of players ingame
team empty ttag.tagged
execute store result score #startwithtnt ttag.game if entity @a[tag=!admin]
scoreboard players operation #startwithtnt ttag.game *= num.bomb ttag.config
scoreboard players operation #startwithtnt ttag.game /= 100 GLOBAL
execute if score #startwithtnt ttag.game matches 0 run scoreboard players set #startwithtnt ttag.game 1
function ttag:states/ingame_tag/start_give_tnt

# tell people
team modify ttag.tagged prefix ""
tellraw @a [{"text":"\nROUND ","bold":true},{"score":{"name":"?round","objective": "ttag.game"},"color":"red"},"/",{"score":{"name":"round.max","objective": "ttag.config"}}," START"]
tellraw @a [{"text":"TNT given to: ","color":"gray"},{"selector":"@a[team=ttag.tagged]","separator": {"text":", ","color":"gray"}},"\n"]
team modify ttag.tagged prefix [{"text":"[","color":"white","bold":true},{"text":"TNT","color":"red"},"] "]

## TODO: set new max time, arena transfer event