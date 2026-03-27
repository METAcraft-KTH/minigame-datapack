# ============================================================
# qq:on/player/rejoin
# Called by: MAIN on reconnect during gameplay
# Executor: Rejoining player
# ============================================================

execute unless score ?superstate main.state matches 3 run return 0
execute unless score @s main.iwashere matches 1 run return 0

# Ensure this player has initialized state for this minigame run
execute unless score @s qq.time_alive matches -2147483648..2147483647 run scoreboard players set @s qq.time_alive 200
execute unless score @s qq.in_state matches 1.. run scoreboard players set @s qq.in_state 0

# Route to the active phase's join handler
execute if score ?state qq.game = state.pregame qq.config run function qq:states/pregame/join
execute if score ?state qq.game = state.ingame qq.config run function qq:states/ingame/join
execute if score ?state qq.game = state.postgame qq.config run function qq:states/postgame/join
