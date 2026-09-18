# only to be called by fireball root in its tick function or from on_wacked

function fireball:uuid/_
data modify entity @n[tag=this_fireball,tag=root,distance=..10,type=item_display] data.target_uuid_string set from storage uuid:out plain
tag @s add fireball.target