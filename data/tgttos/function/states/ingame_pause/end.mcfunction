scoreboard players add ?round.number tgttos.game 1

tag @e[type=marker,tag=tgttos.tp.arena] remove tgttos.tp.arena
execute if score ?round.number tgttos.game matches 2 run tag @n[type=marker,tag=tgttos.tp.2] add tgttos.tp.arena
execute if score ?round.number tgttos.game matches 3 run tag @n[type=marker,tag=tgttos.tp.3] add tgttos.tp.arena
execute if score ?round.number tgttos.game matches 4 run tag @n[type=marker,tag=tgttos.tp.4] add tgttos.tp.arena
execute if score ?round.number tgttos.game matches 5 run tag @n[type=marker,tag=tgttos.tp.5] add tgttos.tp.arena

function tgttos:states/pregame/start