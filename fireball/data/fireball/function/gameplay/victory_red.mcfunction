function fireball:api/end_game_early
#function fireball:ball/kill_all
function fireball:api/game_ended

# 1. Clear any lingering title and set timings (0.5s fade-in, 4s stay, 1s fade-out)
title @a clear
title @a times 10 80 20

# 2. Subtitle with warm fire/brick accents
title @a subtitle {"text":"From the flames of the fortress.","color":"gold","italic":true}

# 3. Main title in Nether Brick crimson red
title @a title {"text":"TEAM NETHER BRICKS WINS","color":"dark_red","bold":true}

# 4. Resonant, fiery victory sound
execute as @a at @a run playsound minecraft:entity.blaze.death voice @a ~ ~ ~ 1 0.7