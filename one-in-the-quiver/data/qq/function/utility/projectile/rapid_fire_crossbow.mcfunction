# infinity
execute if predicate qq:is_infinity_arrow on origin if predicate qq:rapid_fire_mainhand if function qq:utility/projectile/has_arrow run return run item modify entity @s weapon.mainhand qq:charge
execute if predicate qq:is_infinity_arrow on origin if predicate qq:rapid_fire_offhand if function qq:utility/projectile/has_arrow run return run item modify entity @s weapon.offhand qq:charge

# no infinity
execute on origin if predicate qq:rapid_fire_mainhand if function qq:utility/projectile/take_arrow run return run item modify entity @s weapon.mainhand qq:charge
execute on origin if predicate qq:rapid_fire_offhand if function qq:utility/projectile/take_arrow run return run item modify entity @s weapon.offhand qq:charge