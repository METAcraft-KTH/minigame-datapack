# ============================================================
# Called by: main:superstate/2/tick (per tick, when showing slides)
# Executor:  Server
# 
# Tick function while slides are being shown
# (?supertimer main.time >= ?event.start_showing_howtoplay main.time)
# 
# ============================================================


# this macro is necessary bc the library wants me to separate each letter into a list element and im not doing that
$execute if score ?supertimer main.time matches 120 as @a at @s run function tl:title {text:'"$(gamename)"',tick:2,location:"title",sound:"block.note_block.bit master @s ~ ~ ~ 1 0.9 1",args:{is_bold:true}}