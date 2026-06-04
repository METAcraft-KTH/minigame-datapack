# this runs 5 ticks after enter, so that everyone has time to respawn first.

tellraw @a ["",{text:"ROUND OVER!",color:"gold","bold":true}," Don't lose your head now."]

execute as @a[tag=!tnttag.died] run function score:add_points {points:20}
execute as @a[tag=!tnttag.died,team=tnttag.has_diamond] run tellraw @a [{selector:"@s",color:"aqua"}," survived with the diamond!"]
execute as @a[tag=!tnttag.died,team=tnttag.has_diamond] run function score:add_points {points:50}

team leave @a[team=tnttag.has_tnt]
team leave @a[team=tnttag.has_diamond]