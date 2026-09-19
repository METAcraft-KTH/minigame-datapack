# decrement scoreboard
scoreboard players remove #wrapper.rounds fireball 1



execute if score #wrapper.rounds fireball matches ..0 if score #score_it fireball matches 2.. run return run function main:api/end_game_it
execute if score #wrapper.rounds fireball matches ..0 if score #score_data fireball matches 2.. run return run function main:api/end_game_data

## else, play again


# Play again
tellraw @a [{"text":"[!] ","color":"gold","bold":true},{"text":"Next round begins in ","color":"gray"},{"text":"10 seconds","color":"yellow","bold":true},{"text":".","color":"gray"}]
playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1 1
schedule function fireball:api/start 10s