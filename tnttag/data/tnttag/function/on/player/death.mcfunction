# ============================================================
# Called by: main:private/call/death
# Executor:  Player who died
# 
# Triggers on player death.
# Attacker can be selected with "execute on attacker"
# or [tag=on.attacker]
# 
# ============================================================

tag @a remove tnttag.was_tnt
tag @a remove tnttag.was_diamond
execute if entity @s[team=tnttag.has_tnt] run tag @s add tnttag.was_tnt
execute if entity @s[team=tnttag.has_diamond] run tag @s add tnttag.was_diamond
team leave @s

execute if entity @s[tag=tnttag.was_tnt] run tellraw @a [{text:"☠ ",color:"gray"},{selector:"@s",color:"red"}," failed to give away the TNT!"]
execute if entity @s[tag=tnttag.was_diamond] run tellraw @a [{text:"☠ ",color:"gray"},{selector:"@s",color:"aqua"}," had a diamond but died anyway!"]
execute if entity @s[tag=!tnttag.was_tnt,tag=!tnttag.was_diamond] run tellraw @a [{text:"☠ ",color:"gray"},{selector:"@s",color:"white"}," was an unfortunate collateral!"]

title @s times 0 60 20
title @s title {text:"☠",color:"red"}

execute store result score ? tnttag.temp run random value 0..10

execute if score ? tnttag.temp matches 0 run title @s subtitle "You are dead! Not big surprise."
execute if score ? tnttag.temp matches 1 run title @s subtitle "The burning you feel? It is shame."
execute if score ? tnttag.temp matches 2 run title @s subtitle "Pay $4.99 and I'll pretend it didn't happen."
execute if score ? tnttag.temp matches 3 run title @s subtitle "Pro tip: Stay away from TNT"
execute if score ? tnttag.temp matches 4 run title @s subtitle "That was real embarrassin'."
execute if score ? tnttag.temp matches 5 run title @s subtitle "Who send all these babies to fight?"
execute if score ? tnttag.temp matches 6 run title @s subtitle "Watch out for that bomb! Too late."
execute if score ? tnttag.temp matches 7 run title @s subtitle "Who do you think you are?"
execute if score ? tnttag.temp matches 8 run title @s subtitle "That was lame. Get outta there."
execute if score ? tnttag.temp matches 9 run title @s subtitle "Chat, don't clip that!"
execute if score ? tnttag.temp matches 10 run title @s subtitle "Nobody saw that, right?"

tag @s add tnttag.died


#gamemode spectator @s
#tellraw @s {"text":"You died. You will respawn for the next round.","color":"red"}