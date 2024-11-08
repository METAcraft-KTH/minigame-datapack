data modify storage spl:pdb temp set from entity @s UUID
data modify storage spl:pdb args.UUID0 set from storage spl:pdb temp[0]
data modify storage spl:pdb args.UUID1 set from storage spl:pdb temp[1]
data modify storage spl:pdb args.UUID2 set from storage spl:pdb temp[2]
data modify storage spl:pdb args.UUID3 set from storage spl:pdb temp[3]

execute unless data storage spl:pdb in.UUID run data modify storage spl:pdb in.UUID set from entity @s UUID

function spl:playerdb/zprivate/save_me with storage spl:pdb args