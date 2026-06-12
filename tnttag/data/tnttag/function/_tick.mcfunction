# Increment phase timer
scoreboard players add ?phase_timer tnttag.timer 1

# Dispatch to phase-specific tick functions
execute if score ?phase tnttag.state matches 0 run function tnttag:state/pregame/tick
execute if score ?phase tnttag.state matches 1 run function tnttag:state/ingame_tag/tick
execute if score ?phase tnttag.state matches 2 run function tnttag:state/ingame_wait/tick


clear @a[tag=!admin,team=!tnttag.has_tnt] tnt
clear @a[tag=!admin,team=!tnttag.has_diamond] diamond_block
clear @a[tag=!admin,team=] player_head

execute as @a[tag=!admin,team=tnttag.has_tnt] run item replace entity @s armor.head with tnt[enchantments={binding_curse:1},item_model="tnt"]
execute as @a[tag=!admin,team=tnttag.has_tnt] unless predicate {condition:"entity_properties",entity:"this",predicate:{equipment:{mainhand:{items:"tnt"}}}} run clear @s tnt
execute as @a[tag=!admin,team=tnttag.has_tnt] run item replace entity @s weapon.mainhand with tnt[item_name={text:"Punch someone to give me away!",color:"red"}]

execute as @a[tag=!admin,team=tnttag.has_diamond] run item replace entity @s armor.head with diamond_block[enchantments={binding_curse:1},item_model="diamond_block"]
execute as @a[tag=!admin,team=tnttag.has_diamond] unless predicate {condition:"entity_properties",entity:"this",predicate:{equipment:{mainhand:{items:"diamond_block"}}}} run clear @s diamond_block
execute as @a[tag=!admin,team=tnttag.has_diamond] run item replace entity @s weapon.mainhand with diamond_block[item_name={text:"Don't let other players take me away!",color:"aqua"}]

effect give @a regeneration 3 1 true
effect give @a saturation 3 2 true

effect give @a speed 3 1 true
effect give @a[team=tnttag.has_tnt] speed 3 3 true
effect give @a[team=tnttag.has_tnt] jump_boost 3 1
effect clear @a[team=tnttag.has_tnt] glowing
effect give @a[team=tnttag.has_diamond] slowness 3 0
effect give @a[team=tnttag.has_diamond] glowing 1 0

execute at @a[team=tnttag.has_tnt] if predicate {condition:"random_chance",chance:0.3} run particle lava ~ ~1.6 ~ 0 0 0 0.1 1 normal
execute at @a[team=tnttag.has_diamond] run particle wax_off ~ ~1 ~ .3 .3 .3 0.4 1 normal
    
execute at @a run kill @e[type=item,distance=..4,nbt={Item:{id:"minecraft:tnt"}}]
execute at @a run kill @e[type=item,distance=..4,nbt={Item:{id:"minecraft:diamond_block"}}]

title @a[tag=tnttag.not_evacuated] actionbar {text:"Evacuate to the next arena before the round ends!",color:"red"}
execute positioned 19975 37 59730 at @e[type=marker,tag=tnttag.jumppad,distance=..3] as @p[tag=!admin,distance=..1,tag=tnttag.not_evacuated] at @s run function tnttag:jumppad