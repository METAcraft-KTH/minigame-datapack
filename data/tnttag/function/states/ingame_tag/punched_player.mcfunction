advancement revoke @s only tnttag:punched_player

# dont run function if game state is wrong
execute unless score ?state tnttag.game matches 21 run return 0

## TODO: transfer tnt