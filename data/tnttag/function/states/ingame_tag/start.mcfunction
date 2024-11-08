# This function is called when the tagging phase starts.
scoreboard players set ?state tnttag.game 21

# initialize timer
execute store result bossbar tnttag:timer max run scoreboard players get time.ingame_tag tnttag.config
scoreboard players set ?timer tnttag.game 0

bossbar set tnttag:timer color red

# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1
execute as @a[tag=!admin] run function tnttag:states/ingame_tag/reset_player

# increment round counter
scoreboard players add ?round tnttag.game 1

# give out TNT based on % of players ingame
team empty tnttag.tagged
execute store result score #startwithtnt tnttag.game if entity @a[tag=!admin]
scoreboard players operation #startwithtnt tnttag.game *= num.bomb tnttag.config
scoreboard players operation #startwithtnt tnttag.game /= 100 GLOBAL
execute if score #startwithtnt tnttag.game matches 0 run scoreboard players set #startwithtnt tnttag.game 1
function tnttag:states/ingame_tag/start_give_tnt

# tell people
team modify tnttag.tagged prefix ""
tellraw @a [{"text":"\nROUND ","bold":true},{"score":{"name":"?round","objective": "tnttag.game"},"color":"red"},"/",{"score":{"name":"round.max","objective": "tnttag.config"}}," START"]
tellraw @a [{"text":"TNT given to: ","color":"gray"},{"selector":"@a[team=tnttag.tagged]","separator": {"text":", ","color":"gray"}},"\n"]
team modify tnttag.tagged prefix [{"text":"[","color":"white","bold":true},{"text":"TNT","color":"red"},"] "]

## TODO: set new max time, arena transfer event