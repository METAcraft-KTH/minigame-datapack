title @a[tag=!admin] times 0 60 20

title @a[tag=ttag.died,tag=!admin] title {"text":"BLOWN UP","color":"red","bold": true}
title @a[tag=ttag.died,team=ttag.tagged,tag=!admin] subtitle "You were holding TNT"
title @a[tag=ttag.died,team=!ttag.tagged,tag=!admin] subtitle "You stood too close to an explosion"

execute if score ?round ttag.game = round.arena2 ttag.config run title @a[tag=ttag.died,tag=!admin,tag=!ttag.arena2.player] title {"text":"LEFT BEHIND","color":"red","bold": true}
execute if score ?round ttag.game = round.arena2 ttag.config run title @a[tag=ttag.died,tag=!admin,tag=!ttag.arena2.player] subtitle "Did not evacuate in time"
execute if score ?round ttag.game = round.arena3 ttag.config run title @a[tag=ttag.died,tag=!admin,tag=!ttag.arena3.player] title {"text":"LEFT BEHIND","color":"red","bold": true}
execute if score ?round ttag.game = round.arena3 ttag.config run title @a[tag=ttag.died,tag=!admin,tag=!ttag.arena3.player] subtitle "Did not evacuate in time"

title @a[tag=!ttag.died,tag=!admin] title {"text":"SURVIVED","color":"green","bold": true}
title @a[tag=!ttag.died,tag=!admin] subtitle "You did not get blown up"

# get points
execute if score ?round ttag.game < round.arena2 ttag.config as @a[tag=!ttag.died,tag=!admin] run function score:add_points {points:30}
execute if score ?round ttag.game >= round.arena2 ttag.config if score ?round ttag.game < round.arena3 ttag.config as @a[tag=!ttag.died,tag=!admin] run function score:add_points {points:50}
execute if score ?round ttag.game >= round.arena3 ttag.config as @a[tag=!ttag.died,tag=!admin] run function score:add_points {points:70}

# remove tags
tag @a remove ttag.died
team empty ttag.tagged

gamerule showDeathMessages true

# random round end text
execute store result score #text ttag.game run random value 0..10
execute if score #text ttag.game matches 0 run tellraw @a [{"text":"\nROUND OVER! ","color":"red","bold":true},{"text":"It's safe to come out now.\n","color":"gray"}]
execute if score #text ttag.game matches 1 run tellraw @a [{"text":"\nROUND OVER! ","color":"red","bold":true},{"text":"Did anyone else see that??\n","color":"gray"}]
execute if score #text ttag.game matches 2 run tellraw @a [{"text":"\nROUND OVER! ","color":"red","bold":true},{"text":"Nice work, agent 47.\n","color":"gray"}]
execute if score #text ttag.game matches 3 run tellraw @a [{"text":"\nROUND OVER! ","color":"red","bold":true},{"text":"That was crazy.\n","color":"gray"}]
execute if score #text ttag.game matches 4 run tellraw @a [{"text":"\nROUND OVER! ","color":"red","bold":true},{"text":"You played well, maybe even the best.\n","color":"gray"}]
execute if score #text ttag.game matches 5 run tellraw @a [{"text":"\nROUND OVER! ","color":"red","bold":true},{"text":"Hold on, I need to sit down.\n","color":"gray"}]
execute if score #text ttag.game matches 6 run tellraw @a [{"text":"\nROUND OVER! ","color":"red","bold":true},{"text":"Don't jump out of your seat now.\n","color":"gray"}]
execute if score #text ttag.game matches 7 run tellraw @a [{"text":"\nROUND OVER! ","color":"red","bold":true},{"text":"Well, that just happened.\n","color":"gray"}]
execute if score #text ttag.game matches 8 run tellraw @a [{"text":"\nROUND OVER! ","color":"red","bold":true},{"text":"Give yourself a pat on the back.\n","color":"gray"}]
execute if score #text ttag.game matches 9 run tellraw @a [{"text":"\nROUND OVER! ","color":"red","bold":true},{"text":"gg no re\n","color":"gray"}]
execute if score #text ttag.game matches 10 run tellraw @a [{"text":"\nROUND OVER! ","color":"red","bold":true},{"text":"Let's not do that again.\n","color":"gray"}]