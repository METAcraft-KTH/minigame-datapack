### Initialize scoreboards

## GAMENAME.game
scoreboard objectives add GAMENAME.game dummy "Game"

# gamestate
execute unless score .state GAMENAME.game matches -2147483648..2147483647 run scoreboard players set .state GAMENAME.game -1
scoreboard players set state.lobbyinit GAMENAME.game -1
scoreboard players set state.lobby GAMENAME.game 0
scoreboard players set state.pregame GAMENAME.game 1
scoreboard players set state.ingame GAMENAME.game 2
scoreboard players set state.postgame GAMENAME.game 3

### REPLACE 1 WITH UNIQUE GAME ID IN THE TOURNAMENT!!!!!!
scoreboard players set GAMENAME.id GLOBAL 1

## GAMENAME.player_left
scoreboard objectives add GAMENAME.player_left minecraft.custom:minecraft.leave_game "Player left"

## GAMENAME.timer
scoreboard objectives add GAMENAME.timer dummy "Timer"


### bossbar
bossbar add gamename:timer ""
bossbar set gamename:timer visible false

### Initialize teams


### Set gamerules
#gamerule announceAdvancements false
#gamerule blockExplosionDropDecay false
#gamerule commandBlockOutput false
#gamerule commandModificationBlockLimit 32768
#gamerule disableElytraMovementCheck false
#gamerule disablePlayerMovementCheck false
#gamerule disableRaids true
#gamerule doDaylightCycle false
#gamerule doEntityDrops true
#gamerule doFireTick false
#gamerule doImmediateRespawn true
#gamerule doInsomnia false
#gamerule doLimitedCrafting false
#gamerule doMobLoot true
#gamerule doPatrolSpawning false
#gamerule doTileDrops true
#gamerule doTraderSpawning false
#gamerule doVinesSpread false
#gamerule doWardenSpawning false
#gamerule doWeatherCycle false
#gamerule drowningDamage true
#gamerule enderPearlsVanishOnDeath true
#gamerule fallDamage true
#gamerule fireDamage true
#gamerule forgiveDeadPlayers true
#gamerule freezeDamage true
#gamerule globalSoundEvents true
#gamerule keepInventory true
#gamerule lavaSourceConversion false
#gamerule logAdminCommands true
#gamerule maxCommandChainLength 65536
#gamerule maxCommandForkCount 65536
#gamerule maxEntityCramming 24
#gamerule mobExplosionDropDecay false
#gamerule mobGriefing false
#gamerule naturalRegeneration true
#gamerule playersNetherPortalCreativeDelay 1
#gamerule playersNetherPortalDefaultDelay 80
#gamerule projectilesCanBreakBlocks true
#gamerule randomTickSpeed 0
#gamerule reducedDebugInfo false
#gamerule sendCommandFeedback true
#gamerule showDeathMessages true
#gamerule snowAccumulationHeight 1
#gamerule spawnChunkRadius 0
#gamerule spawnRadius 0
#gamerule spectatorsGenerateChunks false
#gamerule tntExplosionDropDecay false
#gamerule universalAnger false
#gamerule waterSourceConversion true