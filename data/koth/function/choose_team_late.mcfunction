# When a player joins the game late, they are assigned to the team with the least number of players.

scoreboard players set #blue_team_size koth.game 0
scoreboard players set #red_team_size koth.game 0

execute as @a[tag=!admin,team=koth.blue] run scoreboard players add #blue_team_size koth.game 1
execute as @a[tag=!admin,team=koth.red] run scoreboard players add #red_team_size koth.game 1

execute if score #blue_team_size koth.game < #red_team_size koth.game run team join koth.blue @s
execute if score #blue_team_size koth.game >= #red_team_size koth.game run team join koth.red @s

scoreboard players reset #blue_team_size koth.game
scoreboard players reset #red_team_size koth.game
