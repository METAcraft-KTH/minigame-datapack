data modify storage tgttos:pdb temp set from entity @s UUID
data modify storage tgttos:pdb args.UUID0 set from storage tgttos:pdb temp[0]
data modify storage tgttos:pdb args.UUID1 set from storage tgttos:pdb temp[1]
data modify storage tgttos:pdb args.UUID2 set from storage tgttos:pdb temp[2]
data modify storage tgttos:pdb args.UUID3 set from storage tgttos:pdb temp[3]

execute unless data storage tgttos:pdb in.UUID run data modify storage tgttos:pdb in.UUID set from entity @s UUID

function tgttos:playerdb/zprivate/save_me with storage tgttos:pdb args