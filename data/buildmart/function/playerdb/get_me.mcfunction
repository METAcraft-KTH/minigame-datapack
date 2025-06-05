data modify storage buildmart:pdb temp set from entity @s UUID
data modify storage buildmart:pdb args.UUID0 set from storage buildmart:pdb temp[0]
data modify storage buildmart:pdb args.UUID1 set from storage buildmart:pdb temp[1]
data modify storage buildmart:pdb args.UUID2 set from storage buildmart:pdb temp[2]
data modify storage buildmart:pdb args.UUID3 set from storage buildmart:pdb temp[3]

function buildmart:playerdb/zprivate/get_me with storage buildmart:pdb args
