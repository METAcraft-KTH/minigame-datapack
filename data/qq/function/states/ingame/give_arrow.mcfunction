# if already has arrow, give then return
execute if items entity @s container.* arrow run return run give @s arrow

# if last hotbar slot taken, give then return
execute if items entity @s hotbar.8 * run return run give @s arrow

# else
item replace entity @s hotbar.8 with arrow