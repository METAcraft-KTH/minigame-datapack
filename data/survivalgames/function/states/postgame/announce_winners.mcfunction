#range Range
$execute if entity @a[distance=..$(range),gamemode=survival] run title @a[distance=..$(range)] title {"text":"","extra":[{"selector":"@a[distance=..$(range),gamemode=survival]"},{"text":" won the game!"}],"color":"green"}
$execute if entity @a[distance=..$(range),gamemode=survival] run tellraw @a[distance=..$(range)] {"text":"","extra":[{"selector":"@a[distance=..$(range),gamemode=survival]"},{"text":" won the game!"}],"color":"green"}
