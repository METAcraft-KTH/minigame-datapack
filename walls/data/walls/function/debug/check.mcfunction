# ============================================================
# walls:debug/check
# Run by hand: function walls:debug/check
# Executor:  Anyone
#
# Prints everything worth knowing when something did not appear.
# Chunk loading is first because it is the usual culprit: every
# ============================================================

tellraw @a {text:"--- walls debug ---",color:"gold",bold:true}

# --- CHUNKS ---
#   in its own file: "if loaded" is the newest command this pack leans on,
#   and if it ever stops parsing only this section is lost, not the rest
#   of the report
function walls:debug/chunks

# --- DEFENDING GOLEMS ---
execute store result score #dbg walls.temp if entity @e[type=iron_golem,tag=walls.golem]
tellraw @a [{text:"defending golems found (want 4): ",color:"gray"},{score:{name:"#dbg",objective:"walls.temp"},color:"white"}]
execute store result score #dbg walls.temp if entity @e[type=iron_golem,tag=walls.golem.it]
tellraw @a [{text:" IT (want 2): ",color:"gray"},{score:{name:"#dbg",objective:"walls.temp"},color:"white"}]
execute store result score #dbg walls.temp if entity @e[type=iron_golem,tag=walls.golem.data]
tellraw @a [{text:" Data (want 2): ",color:"gray"},{score:{name:"#dbg",objective:"walls.temp"},color:"white"}]
execute store result score #dbg walls.temp if entity @e[type=armor_stand,tag=walls.golem_anchor]
tellraw @a [{text:" anchor markers (want 4): ",color:"gray"},{score:{name:"#dbg",objective:"walls.temp"},color:"white"}]
execute as @e[type=iron_golem,tag=walls.golem] run function walls:debug/golem
tellraw @a [{text:"bossbar values (want 600 / 600): ",color:"gray"},{score:{name:"#it_hp",objective:"walls.state"},color:"white"},{text:" / ",color:"gray"},{score:{name:"#data_hp",objective:"walls.state"},color:"white"}]

# --- SHOPS ---
execute store result score #dbg walls.temp if entity @e[type=villager,tag=walls.shop]
tellraw @a [{text:"shop villagers (want 6): ",color:"gray"},{score:{name:"#dbg",objective:"walls.temp"},color:"white"}]
execute as @e[type=villager,tag=walls.shop] run function walls:debug/shop

# --- WALL ---
execute if block 30000 64 60000 bedrock run tellraw @a {text:"wall at 30000 64 60000: bedrock is there",color:"green"}
execute unless block 30000 64 60000 bedrock run tellraw @a {text:"wall at 30000 64 60000: NOT bedrock (either dropped already, or the wall is somewhere else / at another Y)",color:"yellow"}

# --- STATE ---
tellraw @a [{text:"phase (0 prep, 1 dropping, 2 fight, 3 over): ",color:"gray"},{score:{name:"?phase",objective:"walls.state"},color:"white"}]
tellraw @a [{text:"match timer (ticks, wall drops at 12000): ",color:"gray"},{score:{name:"?match_timer",objective:"walls.timer"},color:"white"}]
tellraw @a [{text:"win check armed (want 1): ",color:"gray"},{score:{name:"?ready",objective:"walls.state"},color:"white"}]
tellraw @a [{text:"superstate (want 3 while playing): ",color:"gray"},{score:{name:"?superstate",objective:"main.state"},color:"white"}]
