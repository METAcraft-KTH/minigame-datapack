data modify storage gamename:pdb temp set from entity @s UUID
data modify storage gamename:pdb args.UUID0 set from storage gamename:pdb temp[0]
data modify storage gamename:pdb args.UUID1 set from storage gamename:pdb temp[1]
data modify storage gamename:pdb args.UUID2 set from storage gamename:pdb temp[2]
data modify storage gamename:pdb args.UUID3 set from storage gamename:pdb temp[3]

execute unless data storage gamename:pdb in.UUID run data modify storage gamename:pdb in.UUID set from entity @s UUID

function gamename:playerdb/zprivate/save_me with storage gamename:pdb args