data modify storage atc:pdb temp set from entity @s UUID
data modify storage atc:pdb args.UUID0 set from storage atc:pdb temp[0]
data modify storage atc:pdb args.UUID1 set from storage atc:pdb temp[1]
data modify storage atc:pdb args.UUID2 set from storage atc:pdb temp[2]
data modify storage atc:pdb args.UUID3 set from storage atc:pdb temp[3]

execute unless data storage atc:pdb in.UUID run data modify storage atc:pdb in.UUID set from entity @s UUID

function atc:playerdb/zprivate/save_me with storage atc:pdb args
