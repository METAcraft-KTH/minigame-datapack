# [x,z]*Rot(180) = [-x,-z]
scoreboard players set .x qq.raycast 100
scoreboard players set .z qq.raycast 100
scoreboard players operation .x qq.raycast -= #x qq.raycast
scoreboard players operation .z qq.raycast -= #z qq.raycast