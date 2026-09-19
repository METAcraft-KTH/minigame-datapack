# ============================================================
# walls:events/on_kill_evoker
# Called by: advancement walls:kill_evoker
# Executor:  The player who landed the killing blow
#
# Pattern B: fires freely, guarded by the superstate check.
# ============================================================

advancement revoke @s only walls:kill_evoker
execute unless score ?superstate main.state matches 3 run return 0

give @s prismarine_crystals 15
scoreboard players add @s walls.st.cryst 15

# 2 crystals for the rest of the killer's team
tag @s add walls.tmp_killer
execute if entity @s[team=main.it] run give @a[team=main.it,tag=!walls.tmp_killer] prismarine_crystals 2
execute if entity @s[team=main.it] run scoreboard players add @a[team=main.it,tag=!walls.tmp_killer] walls.st.cryst 2
execute if entity @s[team=main.data] run give @a[team=main.data,tag=!walls.tmp_killer] prismarine_crystals 2
execute if entity @s[team=main.data] run scoreboard players add @a[team=main.data,tag=!walls.tmp_killer] walls.st.cryst 2
tag @s remove walls.tmp_killer

tellraw @a [{selector:"@s"},{text:" killed the Evoker!",color:"gold"}]
execute as @a at @s run playsound entity.player.levelup master @s ~ ~ ~ 1 0.8
