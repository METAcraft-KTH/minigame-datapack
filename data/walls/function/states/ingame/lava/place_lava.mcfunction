#xDist
#zDist
$fill ~ ~1 ~ ~$(xDist) ~1 ~$(zDist) light[level=0] replace water
$fill ~ ~ ~ ~$(xDist) ~ ~$(zDist) lava replace #walls:can_lava_replace
tp @s ~ ~1 ~
