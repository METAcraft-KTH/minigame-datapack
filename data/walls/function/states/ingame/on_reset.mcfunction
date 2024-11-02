# id
setblock ~ ~ ~ structure_block
$data modify block ~ ~ ~ name set from storage walls:maps r$(id)_map.name
$data modify block ~ ~ ~ posX set from storage walls:maps r$(id)_map.posX
$data modify block ~ ~ ~ posY set from storage walls:maps r$(id)_map.posY
$data modify block ~ ~ ~ posZ set from storage walls:maps r$(id)_map.posZ
$data modify block ~ ~ ~ rotation set from storage walls:maps r$(id)_map.rotation
$data modify block ~ ~ ~ mirror set from storage walls:maps r$(id)_map.mirror
setblock ~ ~1 ~ redstone_block
#fill ~ ~ ~ ~ ~1 ~ barrier
