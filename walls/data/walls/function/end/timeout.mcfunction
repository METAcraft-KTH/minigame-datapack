# ============================================================
# walls:end/timeout
# Called by: walls:state/fight/tick (once, at 30 minutes)
# Executor:  Server
#
# Decided on the combined golem health walls:golem/tick
# worked out last tick.
# ============================================================

tellraw @a {text:"30 minutes. The match is decided on golem health.",color:"yellow"}

execute if score #it_hp walls.state < #data_hp walls.state run function walls:end/win_data
execute if score #data_hp walls.state < #it_hp walls.state run function walls:end/win_it
execute if score #it_hp walls.state = #data_hp walls.state run function walls:end/draw
