data modify storage atc:pdb temp set from entity @s UUID
data modify storage atc:pdb args.UUID0 set from storage atc:pdb temp[0]
data modify storage atc:pdb args.UUID1 set from storage atc:pdb temp[1]
data modify storage atc:pdb args.UUID2 set from storage atc:pdb temp[2]
data modify storage atc:pdb args.UUID3 set from storage atc:pdb temp[3]

function atc:playerdb/zprivate/get_me with storage atc:pdb args
