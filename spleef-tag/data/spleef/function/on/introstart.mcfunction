# ============================================================
# spleef:on/introstart
# Called by: main:superstate/1/macro_get_intro
# Executor:  Server
# ============================================================

# Ensure arena anchor exists before game start.
execute positioned 50023 32 23 unless entity @n[type=marker,tag=spleef.tp.arena,distance=..1] run summon marker ~ ~ ~ {Tags:["spleef.tp.arena"]}