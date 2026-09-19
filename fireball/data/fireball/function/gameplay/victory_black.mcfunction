function fireball:api/end_game_early
#function fireball:ball/kill_all
function fireball:api/game_ended

# 1. Clear any lingering title and set timings (0.5s fade-in, 4s stay, 1s fade-out)
title @a clear
title @a times 10 80 20

# 2. Subtitle with complementary gray styling
title @a subtitle {"text":"Forged in darkness, carved in stone.","color":"gray","italic":true}

# 3. Main title in dark, heavy Blackstone tones
title @a title {"text":"TEAM BLACKSTONE WINS","color":"dark_gray","bold":true}

# 4. Deep, heavy victory sound
execute as @a at @a run playsound minecraft:entity.iron_golem.death voice @s ~ ~ ~ 1 0.6