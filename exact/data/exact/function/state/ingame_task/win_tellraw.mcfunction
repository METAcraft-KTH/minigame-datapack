# ============================================================
# exact:state/ingame_task/win_print
# Called with macro: {verb:"..."}
# ============================================================

$execute if score #playersdone exact.state matches ..9 run tellraw @a [{text:"00",color:"dark_gray"},{score:{name:"#playersdone",objective:"exact.state"},color:"gold"}," | ",{selector:"@s",color:"green"},{text:" $(verb)",color:"gray"}]
$execute if score #playersdone exact.state matches 10..99 run tellraw @a [{text:"0",color:"dark_gray"},{score:{name:"#playersdone",objective:"exact.state"},color:"gold"}," | ",{selector:"@s",color:"green"},{text:" $(verb)",color:"gray"}]
$execute if score #playersdone exact.state matches 100.. run tellraw @a [{text:"",color:"dark_gray"},{score:{name:"#playersdone",objective:"exact.state"},color:"gold"}," | ",{selector:"@s",color:"green"},{text:" $(verb)",color:"gray"}]
