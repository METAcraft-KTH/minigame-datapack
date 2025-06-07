execute as @a[team=koth.blue] at @s run playsound minecraft:entity.wither.spawn master @s ~ ~ ~ 5 1
execute as @a[team=koth.red] at @s run playsound minecraft:entity.wither.death master @s ~ ~ ~ 1 0

title @a title ["",{"text":"Blue","color":"blue"},{"text":" team wins"}]

scoreboard players operation #diff koth.game = blue koth.game
scoreboard players operation #diff koth.game -= red koth.game
execute store result storage koth:temp points int 1 run scoreboard players get #diff koth.game
execute as @a[team=koth.blue] run function score:add_points with storage koth:temp

function koth:states/postgame/start