advancement revoke @s only qq:hit_by_trident
execute unless score ?state qq.game = state.ingame qq.config run return 0
execute unless score game.id GLOBAL matches 2 run return 0

# kill with damage
execute on attacker run tag @s add attacker
damage @s 100 minecraft:trident by @n[tag=attacker]
tag @n[tag=attacker] remove attacker