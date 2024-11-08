title @a[tag=!admin] times 0 60 20

title @a[tag=ttag.died,tag=!admin] title {"text":"BLOWN UP","color":"red","bold": true}
title @a[tag=ttag.died,team=ttag.tagged,tag=!admin] subtitle "You were holding TNT"
title @a[tag=ttag.died,team=!ttag.tagged,tag=!admin] subtitle "You stood too close to an explosion"

title @a[tag=!ttag.died,tag=!admin] title {"text":"SURVIVED","color":"green","bold": true}
title @a[tag=!ttag.died,tag=!admin] subtitle "You did not get blown up"

tag @a remove ttag.died
team empty ttag.tagged