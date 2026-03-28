execute if score ?alive uhc.state matches 2.. run tellraw @a ["", {"text": "There are now ", "color": "yellow"}, {"score": {"name": "?alive", "objective": "uhc.state"}, "color": "red"}, {"text": " players alive!", "color": "yellow"}]
execute if score ?alive uhc.state matches 1 run function uhc:state/playing/win

scoreboard players operation ?alive_prev uhc.state = ?alive uhc.state
