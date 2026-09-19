function fireball:api/end_game_early
#function fireball:ball/kill_all
function fireball:api/game_ended

# 1. Set fade timings: 10 ticks fade-in (0.5s), 70 ticks stay (3.5s), 20 ticks fade-out (1.0s)
title @a times 10 70 20

# 2. Set the subtitle first so it appears at the same time as the title
title @a subtitle {"text":"Better luck next time!","color":"gray","italic":true}

# 3. Trigger the main title
title @a title {"text":"GAME OVER","color":"dark_red","bold":true}

execute as @a at @a run playsound minecraft:entity.wither.death master @s ~ ~ ~ 1 0.5