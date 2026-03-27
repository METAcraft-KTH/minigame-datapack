data modify storage spleef:pdb temp set from entity @s UUID
data modify storage spleef:pdb args.UUID0 set from storage spleef:pdb temp[0]
data modify storage spleef:pdb args.UUID1 set from storage spleef:pdb temp[1]
data modify storage spleef:pdb args.UUID2 set from storage spleef:pdb temp[2]
data modify storage spleef:pdb args.UUID3 set from storage spleef:pdb temp[3]

function spleef:playerdb/zprivate/new_player with storage spleef:pdb args