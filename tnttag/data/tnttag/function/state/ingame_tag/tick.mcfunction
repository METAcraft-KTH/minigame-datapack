# ============================================================
# tnttag:state/ingame_task/tick
# Called every tick during tag phase
# (20 seconds = 400 ticks)
# ============================================================

bossbar set tnttag:white visible true
bossbar set tnttag:red visible true
bossbar set tnttag:blue visible true
bossbar set tnttag:white players @a[tag=!admin,team=]
bossbar set tnttag:red players @a[tag=!admin,team=tnttag.has_tnt]
bossbar set tnttag:blue players @a[tag=!admin,team=tnttag.has_diamond]
execute store result bossbar tnttag:white value run scoreboard players get ?phase_timer tnttag.timer
execute store result bossbar tnttag:red value run scoreboard players get ?phase_timer tnttag.timer
execute store result bossbar tnttag:blue value run scoreboard players get ?phase_timer tnttag.timer

# set spawnpoint
execute if score ?round tnttag.state matches 1..4 run spawnpoint @a 19958 24 60071
execute if score ?round tnttag.state matches 5..9 run spawnpoint @a 19959 -2 59912
execute if score ?round tnttag.state matches 10..14 run spawnpoint @a 19986 8 59736
execute if score ?round tnttag.state matches 15.. run spawnpoint @a 19986 -33 59577

# Check if task duration (400 ticks) has passed
execute if score ?phase_timer tnttag.timer >= ?tag_duration tnttag.state run function tnttag:state/ingame_tag/exit
