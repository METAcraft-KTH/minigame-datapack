# message
# args Use "" for default behaviour
$execute if score #displayseconds WALLS.game matches ..9 run bossbar set walls:timer name {"text": $(message),$(args) "extra": [{"score": {"name": "#displayminutes","objective": "WALLS.game"}},":0",{"score": {"name": "#displayseconds","objective": "WALLS.game"}}]}
$execute if score #displayseconds WALLS.game matches 10.. run bossbar set walls:timer name {"text": $(message),$(args) "extra": [{"score": {"name": "#displayminutes","objective": "WALLS.game"}},":",{"score": {"name": "#displayseconds","objective": "WALLS.game"}}]}
