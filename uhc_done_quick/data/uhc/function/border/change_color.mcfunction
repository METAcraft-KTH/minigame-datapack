# Input:
#    color ("red" or "blue")

$item replace entity @s container.0 with stone[item_model="uhc:vertical_world_border_$(color)"]
tag @s remove uhc.red
tag @s remove uhc.blue
$tag @s add uhc.$(color)
#$say "Changed border color to $(color)"