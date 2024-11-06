#id The id
#index The index in the list.
$data modify block ~ ~ ~ name set from storage walls:maps r$(id)_map[$(index)].name
$data modify block ~ ~ ~ posX set from storage walls:maps r$(id)_map[$(index)].posX
$data modify block ~ ~ ~ posY set from storage walls:maps r$(id)_map[$(index)].posY
$data modify block ~ ~ ~ posZ set from storage walls:maps r$(id)_map[$(index)].posZ
$data modify block ~ ~ ~ rotation set from storage walls:maps r$(id)_map[$(index)].rotation
$data modify block ~ ~ ~ mirror set from storage walls:maps r$(id)_map[$(index)].mirror
$data modify block ~ ~ ~ ignoreEntities set from storage walls:maps r$(id)_map[$(index)].ignoreEntities
