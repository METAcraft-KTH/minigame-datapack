# ============================================================
# walls:debug/chunks
# Called by: walls:debug/check
# Executor:  Anyone
#
# Is each golem's corner actually loaded? "NOT LOADED" on its own
# explains missing golems, a part-full bossbar and a wall that
# never drops.
# ============================================================

execute if loaded 29880 64 59880 run tellraw @a {text:"chunk IT north corner: loaded",color:"green"}
execute unless loaded 29880 64 59880 run tellraw @a {text:"chunk IT north corner: NOT LOADED",color:"red"}
execute if loaded 29880 64 60120 run tellraw @a {text:"chunk IT south corner: loaded",color:"green"}
execute unless loaded 29880 64 60120 run tellraw @a {text:"chunk IT south corner: NOT LOADED",color:"red"}
execute if loaded 30120 64 59880 run tellraw @a {text:"chunk Data north corner: loaded",color:"green"}
execute unless loaded 30120 64 59880 run tellraw @a {text:"chunk Data north corner: NOT LOADED",color:"red"}
execute if loaded 30120 64 60120 run tellraw @a {text:"chunk Data south corner: loaded",color:"green"}
execute unless loaded 30120 64 60120 run tellraw @a {text:"chunk Data south corner: NOT LOADED",color:"red"}
