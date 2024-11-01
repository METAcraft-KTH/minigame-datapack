advancement revoke @s only qq:hit_by_trident
execute unless score ?state qq.game = state.ingame qq.config run return 0

# kill with damage
execute on attacker run tag @s add attacker
damage @s 100 minecraft:trident by @p[tag=attacker]
tag @a[tag=attacker] remove attacker