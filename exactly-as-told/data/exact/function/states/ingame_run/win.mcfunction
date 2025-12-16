#advancement revoke @s only exact:portal
execute unless score ?state exact.game matches 22 run return 0
execute if entity @s[gamemode=spectator] run return 0

tag @s add exact.done
clear @s

title @s times 0 60 20
title @s title {"text":"COMPLETE","color":"green",bold:true}

execute store result score #playersdone exact.game if entity @a[tag=!admin,tag=exact.done]

execute if score ?round.number exact.game matches 1 run function exact:states/ingame_run/win_print {verb:"has got their stabbin' license!"}
execute if score ?round.number exact.game matches 2 run function exact:states/ingame_run/win_print {verb:"is a Wall Street expert!"}
execute if score ?round.number exact.game matches 3 run function exact:states/ingame_run/win_print {verb:"is great with their hands!"}
execute if score ?round.number exact.game matches 4 run function exact:states/ingame_run/win_print {verb:"knows color theory!"}
execute if score ?round.number exact.game matches 5 run function exact:states/ingame_run/win_print {verb:"threaded the needle!"}
execute if score ?round.number exact.game matches 6 run function exact:states/ingame_run/win_print {verb:"is 2fast4u!"}
execute if score ?round.number exact.game matches 7 run function exact:states/ingame_run/win_print {verb:"teleported to success!"}
execute if score ?round.number exact.game matches 8 run function exact:states/ingame_run/win_print {verb:"does not skip leg day!"}
execute if score ?round.number exact.game matches 9 run function exact:states/ingame_run/win_print {verb:"is getting a good night's sleep!"}
execute if score ?round.number exact.game matches 10 run function exact:states/ingame_run/win_print {verb:"stopped the chicken invasion!"}
execute if score ?round.number exact.game matches 11 run function exact:states/ingame_run/win_print {verb:"blew up an innocent creature just for fun!"}
execute if score ?round.number exact.game matches 12 run function exact:states/ingame_run/win_print {verb:"has frightening accuracy!"}
execute if score ?round.number exact.game matches 13 run function exact:states/ingame_run/win_print {verb:"made Gordon Ramsay proud!"}
execute if score ?round.number exact.game matches 14 run function exact:states/ingame_run/win_print {verb:"is reckless and proud of it!"}
execute if score ?round.number exact.game matches 15 run function exact:states/ingame_run/win_print {verb:"did the impossible!"}

execute if score #playersdone exact.game matches 1 run function score:add_points {points:100}
execute if score #playersdone exact.game matches 2 run function score:add_points {points:85}
execute if score #playersdone exact.game matches 3 run function score:add_points {points:70}
execute if score #playersdone exact.game matches 4 run function score:add_points {points:60}
execute if score #playersdone exact.game matches 5 run function score:add_points {points:50}
execute if score #playersdone exact.game matches 6 run function score:add_points {points:40}
execute if score #playersdone exact.game matches 7 run function score:add_points {points:30}
execute if score #playersdone exact.game matches 8 run function score:add_points {points:25}
execute if score #playersdone exact.game matches 9 run function score:add_points {points:20}
execute if score #playersdone exact.game matches 10 run function score:add_points {points:15}
execute if score #playersdone exact.game matches 11 run function score:add_points {points:15}
execute if score #playersdone exact.game matches 12 run function score:add_points {points:15}
execute if score #playersdone exact.game matches 13 run function score:add_points {points:15}
execute if score #playersdone exact.game matches 14 run function score:add_points {points:15}
execute if score #playersdone exact.game matches 15 run function score:add_points {points:15}
execute if score #playersdone exact.game matches 16 run function score:add_points {points:10}
execute if score #playersdone exact.game matches 17 run function score:add_points {points:10}
execute if score #playersdone exact.game matches 18 run function score:add_points {points:10}
execute if score #playersdone exact.game matches 19 run function score:add_points {points:10}
execute if score #playersdone exact.game matches 20 run function score:add_points {points:10}
execute if score #playersdone exact.game matches 21.. run function score:add_points {points:5}