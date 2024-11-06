data modify storage tnttag:pdb temp set from entity @s UUID
data modify storage tnttag:pdb args.UUID0 set from storage tnttag:pdb temp[0]
data modify storage tnttag:pdb args.UUID1 set from storage tnttag:pdb temp[1]
data modify storage tnttag:pdb args.UUID2 set from storage tnttag:pdb temp[2]
data modify storage tnttag:pdb args.UUID3 set from storage tnttag:pdb temp[3]

execute unless data storage tnttag:pdb in.UUID run data modify storage tnttag:pdb in.UUID set from entity @s UUID

function tnttag:playerdb/zprivate/save_me with storage tnttag:pdb args