# [x,z]*Rot(90) = [-z,x]
scoreboard players set .x qq.raycast 100
scoreboard players operation .x qq.raycast -= #z qq.raycast
scoreboard players operation .z qq.raycast = #x qq.raycast