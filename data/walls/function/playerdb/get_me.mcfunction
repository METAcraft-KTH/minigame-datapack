data modify storage walls:pdb temp set from entity @s UUID
data modify storage walls:pdb args.UUID0 set from storage walls:pdb temp[0]
data modify storage walls:pdb args.UUID1 set from storage walls:pdb temp[1]
data modify storage walls:pdb args.UUID2 set from storage walls:pdb temp[2]
data modify storage walls:pdb args.UUID3 set from storage walls:pdb temp[3]

function walls:playerdb/zprivate/get_me with storage walls:pdb args
