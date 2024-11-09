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
# bonus points for ppl who start with tnt
execute as @a[team=ttag.tagged] run function score:add_points {points:5}

# tell people
team modify ttag.tagged prefix ""
tellraw @a [{"text":"\nROUND ","bold":true},{"score":{"name":"?round","objective": "ttag.game"},"color":"red"},"/",{"score":{"name":"round.max","objective": "ttag.config"}}," START"]
tellraw @a [{"text":"TNT given to: ","color":"gray"},{"selector":"@a[team=ttag.tagged]","separator": {"text":", ","color":"gray"}},"\n"]
team modify ttag.tagged prefix [{"text":"[","color":"white","bold":true},{"text":"TNT","color":"red"},"] "]

## set new max time, arena transfer event
# sowwy hardcoding this
execute if score ?round ttag.game matches 2 run scoreboard players set time.ingame_tag ttag.config 800
# arena2
execute if score ?round ttag.game = round.arena2 ttag.config run function ttag:states/ingame_tag/start_arena_2
# arena2-3
execute if score ?round ttag.game > round.arena2 ttag.config run scoreboard players set time.ingame_tag ttag.config 700
# arena3
execute if score ?round ttag.game = round.arena3 ttag.config run function ttag:states/ingame_tag/start_arena_3
# after arena3
execute if score ?round ttag.game > round.arena2 ttag.config run scoreboard players set time.ingame_tag ttag.config 600

## random event (unused atm)
#scoreboard players reset ?randomeffect ttag.game
#execute if score ?round ttag.game matches 3..5 store result score ?randomeffect ttag.game run random value 0..4
#execute if score ?randomeffect ttag.game matches 1 run tellraw @a ["",{"text":"Random event ▶ ","color":"blue"},{"text":"Everyone"}]