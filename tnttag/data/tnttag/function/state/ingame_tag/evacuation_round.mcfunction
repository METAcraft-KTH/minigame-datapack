# called by enter

title @a times 0 60 20
title @a title {"text":"EVACUATE!","color":"red","bold":true}
title @a subtitle "Go to the red beacon!"
scoreboard players set ?tag_duration tnttag.state 1800
tag @a add tnttag.not_evacuated