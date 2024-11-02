#id ID of source wall
#action The action to run on the mimics.
$execute unless entity @s[tag=WALLS.following] as @e[tag=WALLS.following,scores={WALLS.following=$(id)}] at @s run $(action)
