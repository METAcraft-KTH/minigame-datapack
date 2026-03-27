# ============================================================
# qq:_tick
# Called by: qq:on/gametick
# Purpose: Internal gameplay state dispatcher while superstate 3
# ============================================================

# Maintain local time-since-death counter for spawn timers and projectile logic
scoreboard players add @a[tag=!admin] qq.time_alive 1

# Dead-state handling is keyed by qq.dead tag set in on/player/death
execute as @a[tag=qq.dead,tag=!admin] if score ?state qq.game = state.pregame qq.config run function qq:states/pregame/while_dead
execute as @a[tag=qq.dead,tag=!admin] if score ?state qq.game = state.ingame qq.config run function qq:states/ingame/while_dead
execute as @a[tag=qq.dead,tag=!admin] if score ?state qq.game = state.postgame qq.config run function qq:states/postgame/while_dead

execute as @a[tag=qq.dead,tag=!admin] if score ?state qq.game = state.pregame qq.config if score @s qq.time_alive matches 1.. run function qq:states/pregame/respawn
execute as @a[tag=qq.dead,tag=!admin] if score ?state qq.game = state.ingame qq.config if score @s qq.time_alive matches 1.. run function qq:states/ingame/respawn
execute as @a[tag=qq.dead,tag=!admin] if score ?state qq.game = state.postgame qq.config if score @s qq.time_alive matches 1.. run function qq:states/postgame/respawn
execute as @a[tag=qq.dead,tag=!admin] if score @s qq.time_alive matches 1.. run tag @s remove qq.dead

# Internal phases
execute if score ?state qq.game = state.pregame qq.config run function qq:states/pregame/tick
execute if score ?state qq.game = state.ingame qq.config run function qq:states/ingame/tick
execute if score ?state qq.game = state.postgame qq.config run function qq:states/postgame/tick

# UI and utility systems
bossbar set qq:timer visible true
bossbar set qq:timer players @a
function qq:utility/tick

# Post tick
execute as @a if predicate qq:on_ground run tag @s add onGround
execute as @a unless predicate qq:on_ground run tag @s remove onGround
tag @a[tag=qq.BlockingWithShield] remove qq.BlockingWithShield
tag @a[tag=qq.jumpJustDown] remove qq.jumpJustDown
