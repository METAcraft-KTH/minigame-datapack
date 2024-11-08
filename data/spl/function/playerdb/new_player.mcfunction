data modify storage spl:pdb temp set from entity @s UUID
data modify storage spl:pdb args.UUID0 set from storage spl:pdb temp[0]
data modify storage spl:pdb args.UUID1 set from storage spl:pdb temp[1]
data modify storage spl:pdb args.UUID2 set from storage spl:pdb temp[2]
data modify storage spl:pdb args.UUID3 set from storage spl:pdb temp[3]

function spl:playerdb/zprivate/new_player with storage spl:pdb args