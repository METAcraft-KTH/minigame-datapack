execute if entity @s[type=interaction,tag=hitbox] on attacker run function fireball:ball/get_wacker
execute if entity @s[type=interaction,tag=!hitbox] on passengers if entity @s[type=block_display] run function fireball:ball/tick_display
