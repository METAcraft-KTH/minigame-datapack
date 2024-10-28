### Initialize scoreboards

## template.game
scoreboard objectives add template.game dummy "Game"

# gamestate
execute unless score .state template.game matches -2147483648..2147483647 run scoreboard players set .state template.game 0
scoreboard players set state.lobby template.game 0
scoreboard players set state.pregame template.game 1
scoreboard players set state.ingame template.game 2
scoreboard players set state.postgame template.game 3

## template.player_left
scoreboard objectives add template.player_left minecraft.custom:minecraft.leave_game "Player left"


### Initialize teams


### Set gamerules
#gamerule announceAdvancements true
#gamerule blockExplosionDropDecay true
#gamerule commandBlockOutput true
#gamerule commandModificationBlockLimit 32768
#gamerule disableElytraMovementCheck false
#gamerule disablePlayerMovementCheck false
#gamerule disableRaids false
#gamerule doDaylightCycle true
#gamerule doEntityDrops true
#gamerule doFireTick true
#gamerule doImmediateRespawn false
#gamerule doInsomnia true
#gamerule doLimitedCrafting false
#gamerule doMobLoot true
#gamerule doPatrolSpawning true
#gamerule doTileDrops true
#gamerule doTraderSpawning true
#gamerule doVinesSpread true
#gamerule doWardenSpawning true
#gamerule doWeatherCycle true
#gamerule drowningDamage true
#gamerule enderPearlsVanishOnDeath true
#gamerule fallDamage true
#gamerule fireDamage true
#gamerule forgiveDeadPlayers true
#gamerule freezeDamage true
#gamerule globalSoundEvents true
#gamerule keepInventory false
#gamerule lavaSourceConversion false
#gamerule logAdminCommands true
#gamerule maxCommandChainLength 65536
#gamerule maxCommandForkCount 65536
#gamerule maxEntityCramming 24
#gamerule mobExplosionDropDecay true
#gamerule mobGriefing true
#gamerule naturalRegeneration true
#gamerule playersNetherPortalCreativeDelay 1
#gamerule playersNetherPortalDefaultDelay 80
#gamerule projectilesCanBreakBlocks true
#gamerule randomTickSpeed 3
#gamerule reducedDebugInfo false
#gamerule sendCommandFeedback true
#gamerule showDeathMessages true
#gamerule snowAccumulationHeight 1
#gamerule spawnChunkRadius 10
#gamerule spectatorsGenerateChunks true
#gamerule tntExplosionDropDecay false
#gamerule universalAnger false
#gamerule waterSourceConversion true