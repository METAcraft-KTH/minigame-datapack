data modify storage gamename:pdb temp set from entity @s UUID
data modify storage gamename:pdb args.UUID0 set from storage gamename:pdb temp[0]
data modify storage gamename:pdb args.UUID1 set from storage gamename:pdb temp[1]
data modify storage gamename:pdb args.UUID2 set from storage gamename:pdb temp[2]
data modify storage gamename:pdb args.UUID3 set from storage gamename:pdb temp[3]

function gamename:playerdb/zprivate/get_me with storage gamename:pdb args