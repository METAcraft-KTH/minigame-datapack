# called by events/punched if the victim has diamond and the puncher has no TNT

team leave @s

tellraw @s [{text:"Your diamond was taken by ",color:"gray"},{selector:"@p[tag=tnttag.puncher]",color:"aqua"},"!"]
tellraw @p[tag=tnttag.puncher] [{selector:"@s",color:"aqua"},{text:"'s diamond was taken by you!",color:"gray"}]

team join tnttag.has_diamond @p[tag=tnttag.puncher]