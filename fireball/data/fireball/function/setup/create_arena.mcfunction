tellraw @s ["",{text:"How to setup the arena:",color:gold,bold:true,underlined:true}]
tellraw @s ["",{text:"This is not an automatic script!",color:red,bold:true}]
tellraw @s ["",{text:"The standard arena can be set up in the following steps using world edit:",color:gray}]
tellraw @s ["",{text:"Please don't move during the procedure",color:gray}]
tellraw @s ["",{text:"0. ",bold:true,color:"white"},{text:"[Start in spectator mode]",color:"dark_gray",click_event:{action:"suggest_command",command:"/gamemode spectator @s"}}]
tellraw @s ["",{text:"1. ",bold:true,color:"white"},{text:"[Go the place you want the center]",color:"aqua",click_event:{action:"suggest_command",command:"/execute in minecraft:the_nether run tp @s 1000 128 1000"}}]
tellraw @s ["",{text:"2. ",bold:true,color:"white"},{text:"[Save arena dimension]",color:"aqua",click_event:{action:"suggest_command",command:"/function fireball:config/set_arena_dimension {dimension:\"minecraft:the_nether\"}"}}]
tellraw @s ["",{text:"3. ",bold:true,color:"white"},{text:"[Mark arena center]",color:"gold",click_event:{action:"suggest_command",command:"/execute positioned ~ ~1 ~ run function fireball:setup/mark_arena_center"}}]
tellraw @s ["",{text:"4. ",bold:true,color:"white"},{text:"[Place Lava]",color:"gold",click_event:{action:"suggest_command",command:"/function fireball:setup/place_lava"}}]
tellraw @s ["",{text:"5. ",bold:true,color:"white"},{text:"[Go to Team1s platform]",color:"red",click_event:{action:"suggest_command",command:"/tp ~ ~ ~30"}}]
tellraw @s ["",{text:"6. ",bold:true,color:"white"},{text:"[Place Red Platform]",color:"red",click_event:{action:"suggest_command",command:"/function fireball:gameplay/place_platform_red"}}]
tellraw @s ["",{text:"7. ",bold:true,color:"white"},{text:"[Save Team1s spawn]",color:"red",click_event:{action:"suggest_command",command:"/execute positioned ~ ~1 ~ run function fireball:config/set_red_team_spawn"}}]
tellraw @s ["",{text:"8. ",bold:true,color:"white"},{text:"[Go to Team2s platform]",color:"dark_gray",click_event:{action:"suggest_command",command:"/tp ~ ~ ~-60"}}]
tellraw @s ["",{text:"9. ",bold:true,color:"white"},{text:"[Place Black Platform]",color:"dark_gray",click_event:{action:"suggest_command",command:"/function fireball:gameplay/place_platform_black"}}]
tellraw @s ["",{text:"10. ",bold:true,color:"white"},{text:"[Save Team2s spawn]",color:"dark_gray",click_event:{action:"suggest_command",command:"/execute positioned ~ ~1 ~ run function fireball:config/set_black_team_spawn"}}]



# WorldEdit command that was used to generate platforms
# //cyl nether_bricks,red_nether_bricks,cracked_nether_bricks 8
# //cyl polished_blackstone_bricks,blackstone,cracked_polished_blackstone_bricks 8