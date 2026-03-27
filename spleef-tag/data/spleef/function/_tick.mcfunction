# ============================================================
# spleef:_tick
# Called by: spleef:on/gametick
# Executor:  Server
#
# Internal state dispatcher for the active minigame.
# ============================================================

execute if score ?state spleef.game = state.pregame spleef.config run function spleef:states/pregame/tick
execute if score ?state spleef.game = state.ingame_spleef spleef.config run function spleef:states/ingame_spleef/tick
execute if score ?state spleef.game = state.ingame_run spleef.config run function spleef:states/ingame_run/tick
execute if score ?state spleef.game = state.ingame_freeze spleef.config run function spleef:states/ingame_freeze/tick


execute positioned 30024 30 50024 as @e[type=item,distance=..100] run data merge entity @s {PickupDelay:0s}

execute as @a[tag=!admin] at @s store result score @s spleef.Y run data get entity @s Pos[1] 1

effect give @a[tag=!admin] night_vision infinite 0 true
effect give @a[tag=!admin] resistance infinite 4 true

execute positioned 30024 30 50024 as @e[type=arrow,distance=..100,nbt={inGround:1b}] at @s run function spleef:utility/as_arrow