# change tags on armorstand
tag @s add this
tag @s add qq.spawnpoint
tag @s remove qq.spawnpoint_preview

# summon marker and copy tags from armorstand
execute summon marker run data modify entity @s Tags set from entity @n[tag=this] Tags

# set position
tp @n[type=marker,tag=this] ~ ~ ~ ~ ~

# remove tag this
tag @n[type=marker,tag=this] remove this

# kill armorstand
kill @s