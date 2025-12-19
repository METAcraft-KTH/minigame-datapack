advancement revoke @s only atc:eat

execute unless score game.id GLOBAL = id atc.config run return 0

give @s[team=atc.hiders] cooked_chicken 1
