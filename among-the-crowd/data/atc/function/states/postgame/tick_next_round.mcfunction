# display remaining time
execute if score #displayseconds atc.game matches ..9 run bossbar set atc:timer name ["Starting next round in ",{"score": {"name": "#displayminutes","objective": "atc.game"}},":0",{"score": {"name": "#displayseconds","objective": "atc.game"}}]
execute if score #displayseconds atc.game matches 10.. run bossbar set atc:timer name ["Starting next round in ",{"score": {"name": "#displayminutes","objective": "atc.game"}},":",{"score": {"name": "#displayseconds","objective": "atc.game"}}]
execute store result bossbar atc:timer value run scoreboard players get ?timer atc.game

#Next round
execute if score ?timer atc.game >= time.postgame atc.config run function atc:states/pregame/start
