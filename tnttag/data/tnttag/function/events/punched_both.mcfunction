# called by events/punched if the victim has diamond and the puncher has no TNT

team leave @s
team leave @p[tag=tnttag.puncher]

tellraw @s [{text:"Your diamond was taken by ",color:"gray"},{selector:"@p[tag=tnttag.puncher]",color:"aqua"},"!"]
tellraw @p[tag=tnttag.puncher] [{selector:"@s",color:"aqua"},{text:"'s diamond was taken by you!",color:"gray"}]

tellraw @s [{selector:"@p[tag=tnttag.puncher]",color:"red"},{text:" gave you the TNT.",color:"gray"}]
tellraw @p[tag=tnttag.puncher] [{text:"You gave the TNT to ",color:"gray"},{selector:"@s",color:"red"},"."]

team join tnttag.has_tnt @s
team join tnttag.has_diamond @p[tag=tnttag.puncher]