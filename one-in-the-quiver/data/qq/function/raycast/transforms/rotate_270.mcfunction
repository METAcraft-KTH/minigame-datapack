# [x,z]*Rot(270) = [z,-x]
scoreboard players set .z qq.raycast 100
scoreboard players operation .z qq.raycast -= #x qq.raycast
scoreboard players operation .x qq.raycast = #z qq.raycast