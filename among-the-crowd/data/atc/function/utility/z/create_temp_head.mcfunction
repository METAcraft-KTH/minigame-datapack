execute summon item_display run tag @s add atc.tmpitem
loot replace entity @n[tag=atc.tmpitem,distance=0..] contents loot {pools:[{rolls:1,entries:[{type:item,name:player_head,functions:[{function:fill_player_head,entity:this}]}]}]}
$execute as @n[tag=atc.tmpitem,distance=0..] run function atc:utility/z/create_temp_head_0 {command: "$(command)"}
