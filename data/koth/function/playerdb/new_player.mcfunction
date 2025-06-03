data modify storage koth:pdb temp set from entity @s UUID
data modify storage koth:pdb args.UUID0 set from storage koth:pdb temp[0]
data modify storage koth:pdb args.UUID1 set from storage koth:pdb temp[1]
data modify storage koth:pdb args.UUID2 set from storage koth:pdb temp[2]
data modify storage koth:pdb args.UUID3 set from storage koth:pdb temp[3]

function koth:playerdb/zprivate/new_player with storage koth:pdb args