# ============================================================
# qq:on/player/death
# Called by: MAIN on player death during gameplay
# Executor: Player who died
# ============================================================

execute unless score ?superstate main.state matches 3 run return 0

scoreboard players set @s qq.time_alive 0
tag @s add qq.dead

execute if score ?state qq.game = state.pregame qq.config run function qq:states/pregame/while_dead
execute if score ?state qq.game = state.ingame qq.config run function qq:states/ingame/while_dead
execute if score ?state qq.game = state.postgame qq.config run function qq:states/postgame/while_dead
