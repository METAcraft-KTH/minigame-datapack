# ============================================================
# tgttos:cap/actionbar
# Called by: tgttos:cap/actionbar_prep, with storage tgttos:ui
# Executor:  Server
#
# Macro args: {c1,c2,o1,o2} — four colour strings.
# ============================================================

$title @a actionbar ["",{text:"■ ",color:"$(o1)"},{text:"Point 1 ",color:"gray"},{score:{name:"#pct1",objective:"tgttos.temp"},color:"$(c1)"},{text:"%",color:"$(c1)"},{text:" · ",color:"dark_gray"},{text:"■ ",color:"$(o2)"},{text:"Point 2 ",color:"gray"},{score:{name:"#pct2",objective:"tgttos.temp"},color:"$(c2)"},{text:"%",color:"$(c2)"}]
