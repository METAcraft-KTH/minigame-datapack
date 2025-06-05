data modify storage buildmart:pdb temp set from entity @s UUID
data modify storage buildmart:pdb args.UUID0 set from storage buildmart:pdb temp[0]
data modify storage buildmart:pdb args.UUID1 set from storage buildmart:pdb temp[1]
data modify storage buildmart:pdb args.UUID2 set from storage buildmart:pdb temp[2]
data modify storage buildmart:pdb args.UUID3 set from storage buildmart:pdb temp[3]

execute unless data storage buildmart:pdb in.UUID run data modify storage buildmart:pdb in.UUID set from entity @s UUID

function buildmart:playerdb/zprivate/save_me with storage buildmart:pdb args
