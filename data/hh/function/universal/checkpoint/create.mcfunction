# change tags on armorstand
tag @s add this
tag @s add hh.checkpoint
tag @s remove hh.checkpoint_preview

# summon marker and copy tags from armorstand
execute summon marker run data modify entity @s Tags set from entity @n[tag=this] Tags

# set position
tp @n[type=marker,tag=this] ~ ~ ~ ~ ~

# set checkpoint id

scoreboard players add .cp hh.checkpoint 1
scoreboard players operation @n[type=marker,tag=this] hh.checkpoint = .cp hh.checkpoint

# remove tag this
tag @n[type=marker,tag=this] remove this

# kill armorstand
kill @s