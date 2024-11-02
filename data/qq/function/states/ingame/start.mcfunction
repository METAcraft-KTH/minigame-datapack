# This function is called when the playable minigame actually begins.
scoreboard players set ?state qq.game 2

# various configs
function qq:states/pregame/configure_gamerule

# initialize timer
execute store result bossbar qq:timer max run scoreboard players get time.ingame qq.config
scoreboard players set ?timer qq.game 0

# tp everyone to the arena
tp @a @n[tag=qq.tp.arena]

# pvp on
team modify qq.players friendlyFire true