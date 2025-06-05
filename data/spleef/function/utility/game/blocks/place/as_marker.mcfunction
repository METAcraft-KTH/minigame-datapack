# do not place block if floor is destroyed
execute if score ?floor.remain spleef.game matches 2.. if entity @s[tag=spleef.floor1] run return 0
execute if score ?floor.remain spleef.game matches 3.. if entity @s[tag=spleef.floor2] run return 0
# if the floor will be destroyed next round, mark with black
execute if score ?floor.next spleef.game matches 2.. if entity @s[tag=spleef.floor1] run return run setblock ~ ~ ~ black_terracotta
execute if score ?floor.next spleef.game matches 3.. if entity @s[tag=spleef.floor2] run return run setblock ~ ~ ~ black_terracotta

execute if score ?colors spleef.game matches 3 store result score . spleef.temp run random value 1..3
execute if score ?colors spleef.game matches 4 store result score . spleef.temp run random value 1..4
execute if score ?colors spleef.game matches 5 store result score . spleef.temp run random value 1..5
execute if score ?colors spleef.game matches 6 store result score . spleef.temp run random value 1..6

execute if score . spleef.temp matches 1 run setblock ~ ~ ~ red_terracotta
execute if score . spleef.temp matches 2 run setblock ~ ~ ~ blue_terracotta
execute if score . spleef.temp matches 3 run setblock ~ ~ ~ green_terracotta
execute if score . spleef.temp matches 4 run setblock ~ ~ ~ pink_terracotta
execute if score . spleef.temp matches 5 run setblock ~ ~ ~ yellow_terracotta
execute if score . spleef.temp matches 6 run setblock ~ ~ ~ purple_terracotta