# Remove target block and light block
setblock ~ ~ ~ air
#setblock ~ ~1 ~ air

# hit effects
particle explosion ~ ~ ~ 0 0 0 1 1 force

# Store origin coords
execute store result score .x var run data get entity @s data.Origin[0] 1
execute store result score .y var run data get entity @s data.Origin[1] 1
execute store result score .z var run data get entity @s data.Origin[2] 1


# Randomize X coords
execute store result score .rand var run random value -10..10
scoreboard players operation .x var += .rand var

# Randomize Y coords
execute store result score .rand var run random value -5..5
scoreboard players operation .y var += .rand var

# Randomize Z coords
execute store result score .rand var run random value -10..10
scoreboard players operation .z var += .rand var


# Set position
execute store result entity @s Pos[0] double 1 run scoreboard players get .x var
execute store result entity @s Pos[1] double 1 run scoreboard players get .y var
execute store result entity @s Pos[2] double 1 run scoreboard players get .z var


# Place new target block
execute at @s run setblock ~ ~ ~ target[power=0]
#execute at @s run setblock ~ ~1 ~ light[level=15]