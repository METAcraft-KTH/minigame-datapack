tellraw @s ["",{text:"How to setup the arena:",color:gold,bold:true,underlined:true}]
tellraw @s ["",{text:"This is not an automatic script!",color:red,bold:true}]
tellraw @s ["",{text:"The standard arena can be set up in the following steps using world edit:",color:gray}]
tellraw @s ["",{text:"Please don't move during the procedure",color:gray}]
tellraw @s ["",{text:"0. ",bold:true,color:"white"},{text:"[Start in spectator mode]",color:"dark_gray",click_event:{action:"suggest_command",command:"/gamemode spectator @s"}}]
tellraw @s ["",{text:"1. ",bold:true,color:"white"},{text:"[Go to the arena centre: 0 128 0, nether roof]",color:"aqua",click_event:{action:"suggest_command",command:"/execute in minecraft:the_nether run tp @s 0 128 0"}}]
tellraw @s ["",{text:"2. ",bold:true,color:"white"},{text:"[Save arena dimension]",color:"aqua",click_event:{action:"suggest_command",command:"/function fireball:config/set_arena_dimension {dimension:\"minecraft:the_nether\"}"}}]
tellraw @s ["",{text:"3. ",bold:true,color:"white"},{text:"[Mark arena center]",color:"gold",click_event:{action:"suggest_command",command:"/execute positioned ~ ~1 ~ run function fireball:setup/mark_arena_center"}}]
tellraw @s ["",{text:"4. ",bold:true,color:"white"},{text:"[Place Lava]",color:"gold",click_event:{action:"suggest_command",command:"/function fireball:setup/place_lava"}}]
tellraw @s ["",{text:"5. ",bold:true,color:"white"},{text:"[Go to Datas platform]",color:"red",click_event:{action:"suggest_command",command:"/tp ~ ~ ~30"}}]
tellraw @s ["",{text:"6. ",bold:true,color:"white"},{text:"[Place Red Platform]",color:"red",click_event:{action:"suggest_command",command:"/function fireball:gameplay/place_platform_red"}}]
tellraw @s ["",{text:"7. ",bold:true,color:"white"},{text:"[Save Datas spawn]",color:"red",click_event:{action:"suggest_command",command:"/execute positioned ~ ~1 ~ run function fireball:config/set_red_team_spawn"}}]
tellraw @s ["",{text:"8. ",bold:true,color:"white"},{text:"[Go to ITs platform]",color:"dark_gray",click_event:{action:"suggest_command",command:"/tp ~ ~ ~-60"}}]
tellraw @s ["",{text:"9. ",bold:true,color:"white"},{text:"[Place Black Platform]",color:"dark_gray",click_event:{action:"suggest_command",command:"/function fireball:gameplay/place_platform_black"}}]
tellraw @s ["",{text:"10. ",bold:true,color:"white"},{text:"[Save ITs spawn]",color:"dark_gray",click_event:{action:"suggest_command",command:"/execute positioned ~ ~1 ~ run function fireball:config/set_black_team_spawn"}}]



# The arena lives on the NETHER ROOF, centred on 0 128 0. The roof is
# a flat bedrock plane, which is what fireball:setup/place_lava needs:
# it fills a single Y layer of lava sources and nothing else holds them
# up. Java's nether is 0..255 tall, so y 128 and above is buildable;
# logical_height 128 only limits portals and chorus fruit.
#
# That centre is hardcoded in five places. Move the arena and you move
# all of them:
#   1. main:intro fireball.camera_starting_coords   (fireball:_load)
#   2. main:intro fireball.player_starting_coords   (fireball:_load)
#   3. the camera/player teleports and the forceload in
#      fireball:on/introstart
#   4. the respawn point in fireball:on/gamestart
#   5. the forceload remove in fireball:gameplay/finish
#
# And the dimension is hardcoded as minecraft:the_nether in every
# fireball:on/* callback, because MAIN calls them from the overworld
# and @e / @n only ever see the dimension they are executed in.
# fireball:_load warns if fireball:config disagrees with that.

# WorldEdit command that was used to generate platforms
# //cyl nether_bricks,red_nether_bricks,cracked_nether_bricks 8
# //cyl polished_blackstone_bricks,blackstone,cracked_polished_blackstone_bricks 8