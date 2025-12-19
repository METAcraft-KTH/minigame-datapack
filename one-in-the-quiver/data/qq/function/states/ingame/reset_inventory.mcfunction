## Inventory
clear @s
effect clear @s
effect give @s saturation infinite 255 true
effect give @s regeneration infinite 1 true

# One in the Quiver
execute if score mode qq.config matches 0 run item replace entity @s hotbar.0 with bow[enchantments={"qq:one_hit":1},unbreakable={},tooltip_display={hidden_components:["unbreakable"]}]
execute if score mode qq.config matches 0 run item replace entity @s hotbar.1 with stone_sword[unbreakable={}, tooltip_display={hidden_components:[unbreakable]}]
execute if score mode qq.config matches 0 run function qq:states/ingame/give_arrow

# Quake
execute if score mode qq.config matches 1 run function qq:give/quake_crossbow
execute if score mode qq.config matches 1 run function qq:give/shield

# Combined
execute if score mode qq.config matches 2 run function qq:give/raycast_crossbow
execute if score mode qq.config matches 2 run function qq:give/iron_sword
execute if score mode qq.config matches 2 run function qq:states/ingame/give_arrow
execute if score mode qq.config matches 2 run effect give @s speed infinite 1 true

# Ghost Trick
execute if score mode qq.config matches 3 run function qq:give/trident
execute if score mode qq.config matches 3 run effect give @s weakness infinite 255 true
