# recursive function to give tnt
team join tnttag.tagged @r[team=!tnttag.tagged,tag=!admin]
scoreboard players remove #startwithtnt tnttag.game 1
execute unless score #startwithtnt tnttag.game matches ..0 run function tnttag:states/ingame_tag/start_give_tnt