execute as @a[gamemode=survival,limit=1] run tag @s add uhc.winner
tellraw @a ["", {"text": "Congratulations ", "color": "green"}, {"selector": "@a[tag=uhc.winner]", "color": "gold"}, {"text": ", you won the game!", "color": "green"}]

scoreboard players set ?state uhc.state 2
scoreboard players set ?timer uhc.time 0
execute if score ?round uhc.state < ?num_rounds uhc.state run function uhc:state/playing/prepare_next_round
execute if score ?round uhc.state >= ?num_rounds uhc.state run function uhc:state/playing/end_game

execute as @a[tag=uhc.winner] run function score:add_points {points:100}
execute as @a[tag=uhc.winner] run tellraw @s ["",{"text":"+100💎 for winning the game!"}]

tag @s remove uhc.winner

