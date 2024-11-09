# This function is called when the playable minigame actually begins.
scoreboard players set ?state qq.game 2

# various configs
function qq:states/pregame/configure_gamerule

# new state, reset GLOBAL.player_in_state
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1

# initialize timer
execute store result bossbar qq:timer max run scoreboard players get time.ingame qq.config
scoreboard players set ?timer qq.game 0

# pvp on
team modify qq.players friendlyFire true

# give everyone an arrow
execute if score mode qq.config matches 0 as @a[tag=!admin] run function qq:states/ingame/give_arrow
execute if score mode qq.config matches 2 as @a[tag=!admin] run function qq:states/ingame/give_arrow

# set score to 0 in order to make give it a value
scoreboard players set @a[tag=!admin] qq.Points 0
scoreboard objectives setdisplay sidebar qq.Points