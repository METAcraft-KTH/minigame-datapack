data modify storage ttag:pdb temp set from entity @s UUID
data modify storage ttag:pdb args.UUID0 set from storage ttag:pdb temp[0]
data modify storage ttag:pdb args.UUID1 set from storage ttag:pdb temp[1]
data modify storage ttag:pdb args.UUID2 set from storage ttag:pdb temp[2]
data modify storage ttag:pdb args.UUID3 set from storage ttag:pdb temp[3]

execute unless data storage ttag:pdb in.UUID run data modify storage ttag:pdb in.UUID set from entity @s UUID

function ttag:playerdb/zprivate/save_me with storage ttag:pdb args