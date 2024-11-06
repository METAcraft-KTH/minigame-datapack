execute as @a[tag=!admin,team=WALLS.red] if function walls:states/ingame/is_r1 run item replace entity @s weapon.offhand with filled_map[map_id=9,enchantments={vanishing_curse:1}]
execute as @a[tag=!admin,team=WALLS.blue] if function walls:states/ingame/is_r1 run item replace entity @s weapon.offhand with filled_map[map_id=10,enchantments={vanishing_curse:1}]
execute as @a[tag=!admin,team=WALLS.green] if function walls:states/ingame/is_r1 run item replace entity @s weapon.offhand with filled_map[map_id=11,enchantments={vanishing_curse:1}]
execute as @a[tag=!admin,team=WALLS.yellow] if function walls:states/ingame/is_r1 run item replace entity @s weapon.offhand with filled_map[map_id=12,enchantments={vanishing_curse:1}]

execute as @a[tag=!admin,team=WALLS.red] if function walls:states/ingame/is_r2 run item replace entity @s weapon.offhand with filled_map[map_id=14,enchantments={vanishing_curse:1}]
execute as @a[tag=!admin,team=WALLS.blue] if function walls:states/ingame/is_r2 run item replace entity @s weapon.offhand with filled_map[map_id=15,enchantments={vanishing_curse:1}]