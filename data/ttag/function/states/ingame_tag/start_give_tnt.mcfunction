# recursive function to give tnt
team join ttag.tagged @r[team=!ttag.tagged,tag=!admin]
scoreboard players remove #startwithtnt ttag.game 1
execute unless score #startwithtnt ttag.game matches ..0 run function ttag:states/ingame_tag/start_give_tnt