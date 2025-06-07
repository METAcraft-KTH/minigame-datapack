## INGAME_CP PHASE: The game has begun, and people are playing

# manage rejoin etc
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function koth:states/ingame_cp/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function koth:states/ingame_cp/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function koth:states/ingame_cp/respawn

# increment timer
scoreboard players add ?timer koth.game 1
# calculate remaining time
scoreboard players operation #remainingseconds koth.game = time.ingame_cp koth.config
scoreboard players operation #remainingseconds koth.game -= ?timer koth.game
scoreboard players operation #remainingseconds koth.game /= 20 GLOBAL
scoreboard players operation #displayminutes koth.game = #remainingseconds koth.game
scoreboard players operation #displayminutes koth.game /= 60 GLOBAL
scoreboard players operation #displayseconds koth.game = #remainingseconds koth.game
scoreboard players operation #displayseconds koth.game %= 60 GLOBAL
# display remaining time
bossbar set koth:timer visible false
execute if score #displayseconds koth.game matches ..9 run bossbar set koth:timer name ["Time remaining is ",{"score": {"name": "#displayminutes","objective": "koth.game"}},":0",{"score": {"name": "#displayseconds","objective": "koth.game"}}]
execute if score #displayseconds koth.game matches 10.. run bossbar set koth:timer name ["Time remaining is ",{"score": {"name": "#displayminutes","objective": "koth.game"}},":",{"score": {"name": "#displayseconds","objective": "koth.game"}}]
execute store result bossbar koth:timer value run scoreboard players get ?timer koth.game

## end game
# execute if score ?timer koth.game >= time.ingame_cp koth.config run function koth:states/postgame/start
execute if score blue koth.game >= cp.target koth.config run function koth:win/blue
execute if score red koth.game >= cp.target koth.config run function koth:win/red

# Control points are now enabled!
execute as @e[tag=koth.cp] at @s rotated as @s run function koth:cp/tick

# Prepare the display
scoreboard players operation ne koth.cp = @e[tag=koth.cp.ne] koth.cp
scoreboard players operation center koth.cp = @e[tag=koth.cp.center] koth.cp
scoreboard players operation sw koth.cp = @e[tag=koth.cp.sw] koth.cp
execute if score ne koth.cp matches ..-1 run scoreboard players operation ne koth.cp *= -1 GLOBAL
execute if score center koth.cp matches ..-1 run scoreboard players operation center koth.cp *= -1 GLOBAL
execute if score sw koth.cp matches ..-1 run scoreboard players operation sw koth.cp *= -1 GLOBAL
scoreboard players operation #time_mod koth.game = ?timer koth.game
scoreboard players operation #time_mod koth.game %= 20 GLOBAL
scoreboard players operation #flash_mod koth.game = ?timer koth.game
scoreboard players operation #flash_mod koth.game %= 4 GLOBAL

execute if score #time_mod koth.game matches 0 as @e[tag=koth.cp] if score @s koth.cp matches 100 run scoreboard players add blue koth.game 1
execute if score #time_mod koth.game matches 0 as @e[tag=koth.cp] if score @s koth.cp matches -100 run scoreboard players add red koth.game 1

scoreboard players set line1 koth.display 1
scoreboard players display name line1 koth.display [{"text": "Blue: "}, {"score": {"name": "blue", "objective": "koth.game"}}, {"text": " / "}, {"score": {"name": "cp.target", "objective": "koth.config"}}]
scoreboard players display name line2 koth.display [{"text": "Red: "}, {"score": {"name": "red", "objective": "koth.game"}}, {"text": " / "}, {"score": {"name": "cp.target", "objective": "koth.config"}}]
scoreboard players display name line3 koth.display [{"text":""}]

execute if score @n[tag=koth.cp.ne] koth.cp matches 100 run scoreboard players display name line4 koth.display [{"text":"North-East: "}, {"score": {"name": "ne", "objective": "koth.cp"}, "color": "blue"}, {"text": "%", "color": "blue"}]
execute if score @n[tag=koth.cp.ne] koth.cp matches -100 run scoreboard players display name line4 koth.display [{"text":"North-East: "}, {"score": {"name": "ne", "objective": "koth.cp"}, "color": "red"}, {"text": "%", "color": "red"}]
execute if score @n[tag=koth.cp.ne] koth.cp matches -99..99 unless score @n[tag=koth.cp.ne] koth.cp matches -1..1 if score #flash_mod koth.game matches 0..1 run scoreboard players display name line4 koth.display [{"text":"North-East: "}, {"score": {"name": "ne", "objective": "koth.cp"}, "color": "yellow"}, {"text": "%", "color": "yellow"}]
execute if score @n[tag=koth.cp.ne] koth.cp matches -99..99 unless score @n[tag=koth.cp.ne] koth.cp matches -1..1 if score #flash_mod koth.game matches 2..3 run scoreboard players display name line4 koth.display [{"text":"North-East: "}, {"score": {"name": "ne", "objective": "koth.cp"}, "color": "black"}, {"text": "%", "color": "black"}]
execute if score @n[tag=koth.cp.ne] koth.cp matches -1..1 run scoreboard players display name line4 koth.display [{"text":"North-East: "}, {"score": {"name": "ne", "objective": "koth.cp"}, "color": "white"}, {"text": "%", "color": "white"}]

execute if score @n[tag=koth.cp.center] koth.cp matches 100 run scoreboard players display name line5 koth.display [{"text":"Center: "}, {"score": {"name": "center", "objective": "koth.cp"}, "color": "blue"}, {"text": "%", "color": "blue"}]
execute if score @n[tag=koth.cp.center] koth.cp matches -100 run scoreboard players display name line5 koth.display [{"text":"Center: "}, {"score": {"name": "center", "objective": "koth.cp"}, "color": "red"}, {"text": "%", "color": "red"}]
execute if score @n[tag=koth.cp.center] koth.cp matches -99..99 unless score @n[tag=koth.cp.center] koth.cp matches -1..1 if score #flash_mod koth.game matches 0..1 run scoreboard players display name line5 koth.display [{"text":"Center: "}, {"score": {"name": "center", "objective": "koth.cp"}, "color": "yellow"}, {"text": "%", "color": "yellow"}]
execute if score @n[tag=koth.cp.center] koth.cp matches -99..99 unless score @n[tag=koth.cp.center] koth.cp matches -1..1 if score #flash_mod koth.game matches 2..3 run scoreboard players display name line5 koth.display [{"text":"Center: "}, {"score": {"name": "center", "objective": "koth.cp"}, "color": "black"}, {"text": "%", "color": "black"}]
execute if score @n[tag=koth.cp.center] koth.cp matches -1..1 run scoreboard players display name line5 koth.display [{"text":"Center: "}, {"score": {"name": "center", "objective": "koth.cp"}, "color": "white"}, {"text": "%", "color": "white"}]

execute if score @n[tag=koth.cp.sw] koth.cp matches 100 run scoreboard players display name line6 koth.display [{"text":"South-West: "}, {"score": {"name": "sw", "objective": "koth.cp"}, "color": "blue"}, {"text": "%", "color": "blue"}]
execute if score @n[tag=koth.cp.sw] koth.cp matches -100 run scoreboard players display name line6 koth.display [{"text":"South-West: "}, {"score": {"name": "sw", "objective": "koth.cp"}, "color": "red"}, {"text": "%", "color": "red"}]
execute if score @n[tag=koth.cp.sw] koth.cp matches -99..99 unless score @n[tag=koth.cp.sw] koth.cp matches -1..1 if score #flash_mod koth.game matches 0..1 run scoreboard players display name line6 koth.display [{"text":"South-West: "}, {"score": {"name": "sw", "objective": "koth.cp"}, "color": "yellow"}, {"text": "%", "color": "yellow"}]
execute if score @n[tag=koth.cp.sw] koth.cp matches -99..99 unless score @n[tag=koth.cp.sw] koth.cp matches -1..1 if score #flash_mod koth.game matches 2..3 run scoreboard players display name line6 koth.display [{"text":"South-West: "}, {"score": {"name": "sw", "objective": "koth.cp"}, "color": "black"}, {"text": "%", "color": "black"}]
execute if score @n[tag=koth.cp.sw] koth.cp matches -1..1 run scoreboard players display name line6 koth.display [{"text":"South-West: "}, {"score": {"name": "sw", "objective": "koth.cp"}, "color": "white"}, {"text": "%", "color": "white"}]
