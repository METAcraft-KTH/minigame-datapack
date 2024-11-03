execute store result score #red_playercount WALLS.tmp run execute if entity @a[team=WALLS.red,gamemode=survival]
execute store result score #blue_playercount WALLS.tmp run execute if entity @a[team=WALLS.blue,gamemode=survival]
execute store result score #green_playercount WALLS.tmp run execute if entity @a[team=WALLS.green,gamemode=survival]
execute store result score #yellow_playercount WALLS.tmp run execute if entity @a[team=WALLS.yellow,gamemode=survival]


execute if score #red_playercount WALLS.tmp matches 1.. if score #blue_playercount WALLS.tmp matches 0 if score #green_playercount WALLS.tmp matches 0 if score #yellow_playercount WALLS.tmp matches 0 run function walls:states/ingame/gameover/red_victory
execute if score #red_playercount WALLS.tmp matches 0 if score #blue_playercount WALLS.tmp matches 1.. if score #green_playercount WALLS.tmp matches 0 if score #yellow_playercount WALLS.tmp matches 0 run function walls:states/ingame/gameover/blue_victory
execute if score #red_playercount WALLS.tmp matches 0 if score #blue_playercount WALLS.tmp matches 0 if score #green_playercount WALLS.tmp matches 1.. if score #yellow_playercount WALLS.tmp matches 0 run function walls:states/ingame/gameover/green_victory
execute if score #red_playercount WALLS.tmp matches 0 if score #blue_playercount WALLS.tmp matches 0 if score #green_playercount WALLS.tmp matches 0 if score #yellow_playercount WALLS.tmp matches 1.. run function walls:states/ingame/gameover/yellow_victory
