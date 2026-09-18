# executes on a player that wacked the ball. It is run from ball tick, so fireball.target tag is correct.
# changes the target randomly, prioritizes opposite team
tag @a[tag=fireball.target] remove fireball.target
execute if entity @s[team=fireball.black] as @r[team=fireball.red] run return run tag @s add fireball.target
execute if entity @s[team=fireball.red] as @r[team=fireball.black] run return run tag @s add fireball.target

# if there is only one team then no one is safe
tag @r add fireball.target
