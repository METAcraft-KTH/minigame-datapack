scoreboard players add ?round.number exact.game 1

tag @e[type=marker,tag=exact.tp.arena] remove exact.tp.arena
execute if score ?round.number exact.game matches 2 run tag @n[type=marker,tag=exact.tp.2] add exact.tp.arena
execute if score ?round.number exact.game matches 3 run tag @n[type=marker,tag=exact.tp.3] add exact.tp.arena
execute if score ?round.number exact.game matches 4 run tag @n[type=marker,tag=exact.tp.4] add exact.tp.arena
execute if score ?round.number exact.game matches 5 run tag @n[type=marker,tag=exact.tp.5] add exact.tp.arena

function exact:states/pregame/start