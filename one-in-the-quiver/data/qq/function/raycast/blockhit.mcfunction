# target
execute if block ~ ~ ~ target as @a[tag=thisOwner] at @s run playsound minecraft:entity.arrow.hit_player player @s ~ ~ ~ 100 1 1
execute if block ~ ~ ~ target as @a[tag=thisOwner,gamemode=!creative] if items entity @s weapon.* *[!custom_data={reload:1b,raycast:1b}] run function qq:states/ingame/give_arrow
execute if block ~ ~ ~ target run setblock ~ ~ ~ target[power=15]

# decorated pot
execute if block ~ ~ ~ decorated_pot run data remove storage qq:temp pot
execute if block ~ ~ ~ decorated_pot run data modify storage qq:temp pot set from block ~ ~ ~ item
execute if block ~ ~ ~ decorated_pot run setblock ~ ~ ~ decorated_pot[cracked=true]
execute if block ~ ~ ~ decorated_pot run data modify block ~ ~ ~ item set from storage qq:temp pot
execute if block ~ ~ ~ decorated_pot run setblock ~ ~ ~ air destroy
