# smallest
# other
# other2

$execute unless score $(smallest) SURVIVALGAMES.lobby_sizes matches -2147483648..2147483647 run scoreboard players set $(smallest) SURVIVALGAMES.lobby_sizes 0
$execute unless score $(other) SURVIVALGAMES.lobby_sizes matches -2147483648..2147483647 run scoreboard players set $(other) SURVIVALGAMES.lobby_sizes 0
$execute unless score $(other2) SURVIVALGAMES.lobby_sizes matches -2147483648..2147483647 run scoreboard players set $(other2) SURVIVALGAMES.lobby_sizes 0


$execute if score $(smallest) SURVIVALGAMES.lobby_sizes <= $(other) SURVIVALGAMES.lobby_sizes if score $(smallest) SURVIVALGAMES.lobby_sizes <= $(other2) SURVIVALGAMES.lobby_sizes run return 1
return fail
