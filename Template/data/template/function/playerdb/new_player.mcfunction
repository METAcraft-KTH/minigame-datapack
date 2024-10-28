data modify storage template:pdb temp set from entity @s UUID
data modify storage template:pdb args.UUID0 set from storage template:pdb temp[0]
data modify storage template:pdb args.UUID1 set from storage template:pdb temp[1]
data modify storage template:pdb args.UUID2 set from storage template:pdb temp[2]
data modify storage template:pdb args.UUID3 set from storage template:pdb temp[3]

function template:playerdb/zprivate/new_player with storage template:pdb args