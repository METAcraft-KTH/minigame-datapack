#range Range
$execute if entity @a[distance=..$(range),gamemode=adventure] run title @a[distance=..$(range)] title {"text":"","extra":[{"selector":"@a[distance=..$(range),gamemode=adventure]"},{"text":" won the game!"}],"color":"green"}
$execute if entity @a[distance=..$(range),gamemode=adventure] run tellraw @a[distance=..$(range)] {"text":"","extra":[{"selector":"@a[distance=..$(range),gamemode=adventure]"},{"text":" won the game!"}],"color":"green"}
