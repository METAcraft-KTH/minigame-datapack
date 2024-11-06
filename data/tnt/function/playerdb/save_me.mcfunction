data modify storage tnt:pdb temp set from entity @s UUID
data modify storage tnt:pdb args.UUID0 set from storage tnt:pdb temp[0]
data modify storage tnt:pdb args.UUID1 set from storage tnt:pdb temp[1]
data modify storage tnt:pdb args.UUID2 set from storage tnt:pdb temp[2]
data modify storage tnt:pdb args.UUID3 set from storage tnt:pdb temp[3]

execute unless data storage tnt:pdb in.UUID run data modify storage tnt:pdb in.UUID set from entity @s UUID

function tnt:playerdb/zprivate/save_me with storage tnt:pdb args