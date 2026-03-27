data modify storage spleef:pdb temp set from entity @s UUID
data modify storage spleef:pdb args.UUID0 set from storage spleef:pdb temp[0]
data modify storage spleef:pdb args.UUID1 set from storage spleef:pdb temp[1]
data modify storage spleef:pdb args.UUID2 set from storage spleef:pdb temp[2]
data modify storage spleef:pdb args.UUID3 set from storage spleef:pdb temp[3]

execute unless data storage spleef:pdb in.UUID run data modify storage spleef:pdb in.UUID set from entity @s UUID

function spleef:playerdb/zprivate/save_me with storage spleef:pdb args