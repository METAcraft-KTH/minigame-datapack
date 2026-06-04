# called by events/punched if the victim has diamond and the puncher has no TNT

team leave @p[tag=tnttag.puncher]

tellraw @s [{selector:"@p[tag=tnttag.puncher]",color:"red"},{text:" gave you the TNT.",color:"gray"}]
tellraw @p[tag=tnttag.puncher] [{text:"You gave the TNT to ",color:"gray"},{selector:"@s",color:"red"},"."]

team join tnttag.has_tnt @s