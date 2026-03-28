# Set the center y-level of the vertical world border
# Input:
#    "100y", the y-level that the border should target multiplied by 100

$scoreboard players set #100y uhc.temp $(100y)
scoreboard players operation ?world_border_center_y_100x uhc.state = #100y uhc.temp

function uhc:border/border_tick
