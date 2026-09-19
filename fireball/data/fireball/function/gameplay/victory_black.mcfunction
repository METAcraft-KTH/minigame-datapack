function fireball:api/end_game_early
#function fireball:ball/kill_all
function fireball:api/game_ended

scoreboard players add #score_it fireball 1

# 1. Clear previous titles and configure timings (0.5s fade-in, 4s stay, 1s fade-out)
title @a clear
title @a times 10 80 20

# 2. Subtitle displaying the 3-round series score
title @a subtitle [{"text":"Series: ","color":"gray"},{"text":"IT ","color":"blue","bold":true},{"score":{"name":"#score_it","objective":"fireball"},"color":"aqua","bold":true},{"text":" - ","color":"dark_gray"},{"score":{"name":"#score_data","objective":"fireball"},"color":"gray","bold":true},{"text":" Data","color":"yellow","bold":true}]

# 3. Main title
title @a title {"text":"TEAM IT WINS","color":"blue","bold":true}

# 4. Victory fanfare
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 1.2
