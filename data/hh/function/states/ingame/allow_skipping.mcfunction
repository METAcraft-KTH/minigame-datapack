execute unless items entity @s hotbar.8 *[minecraft:custom_data={hh.skipbook:1b}] run clear @s *[minecraft:custom_data={hh.skipbook:1b}]
execute unless items entity @s hotbar.8 *[minecraft:custom_data={hh.skipbook:1b}] run function hh:give/skip
scoreboard players enable @s hh.skip