execute as @a[distance=500..] at @s run playsound entity.arrow.hit_player master @s ~ ~ ~ 1

title @a[distance=500..] subtitle {"text":"until next gamemode","color":"yellow"}
title @a[distance=500..] title {"score":{"name":".typetimeleft","objective":"Spleef.State"},"color":"aqua"}