# ============================================================
# tnttag:state/pregame/tick
# Called every tick during pregame phase (15 seconds = 300 ticks)
# ============================================================

# Check if pregame duration (300 ticks) has passed
execute if score ?phase_timer tnttag.timer matches 300.. run function tnttag:state/pregame/exit

title @a times 0 80 20
execute if score ?phase_timer tnttag.timer matches 100.. run title @a subtitle "seconds until chaos begins"
execute if score ?phase_timer tnttag.timer matches 100 run title @a title "10"
execute if score ?phase_timer tnttag.timer matches 120 run title @a title "9"
execute if score ?phase_timer tnttag.timer matches 140 run title @a title "8"
execute if score ?phase_timer tnttag.timer matches 160 run title @a title "7"
execute if score ?phase_timer tnttag.timer matches 180 run title @a title "6"
execute if score ?phase_timer tnttag.timer matches 200 run title @a title "5"
execute if score ?phase_timer tnttag.timer matches 220 run title @a title "4"
execute if score ?phase_timer tnttag.timer matches 240 run title @a title "3"
execute if score ?phase_timer tnttag.timer matches 260 run title @a title "2"
execute if score ?phase_timer tnttag.timer matches 280 run title @a title "1"
execute if score ?phase_timer tnttag.timer matches 280 run title @a subtitle "second until chaos begins"


bossbar set tnttag:white players @a
bossbar set tnttag:white name "Tactical TNT incoming..."
bossbar set tnttag:white max 300
execute store result bossbar tnttag:white value run scoreboard players get ?phase_timer tnttag.timer