data modify storage exact:pdb temp set from entity @s UUID
data modify storage exact:pdb args.UUID0 set from storage exact:pdb temp[0]
data modify storage exact:pdb args.UUID1 set from storage exact:pdb temp[1]
data modify storage exact:pdb args.UUID2 set from storage exact:pdb temp[2]
data modify storage exact:pdb args.UUID3 set from storage exact:pdb temp[3]

execute unless data storage exact:pdb in.UUID run data modify storage exact:pdb in.UUID set from entity @s UUID

function exact:playerdb/zprivate/save_me with storage exact:pdb args