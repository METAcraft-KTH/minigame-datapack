data modify storage survivalgames:pdb temp set from entity @s UUID
data modify storage survivalgames:pdb args.UUID0 set from storage survivalgames:pdb temp[0]
data modify storage survivalgames:pdb args.UUID1 set from storage survivalgames:pdb temp[1]
data modify storage survivalgames:pdb args.UUID2 set from storage survivalgames:pdb temp[2]
data modify storage survivalgames:pdb args.UUID3 set from storage survivalgames:pdb temp[3]

function survivalgames:playerdb/zprivate/get_me with storage survivalgames:pdb args