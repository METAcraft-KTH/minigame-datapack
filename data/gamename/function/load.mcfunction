### Initialize scoreboards

## Creating objectives
scoreboard objectives add GAMENAME.game dummy
scoreboard objectives add GAMENAME.config dummy
execute unless score ?state GAMENAME.game matches -2147483648..2147483647 run scoreboard players set ?state GAMENAME.game -1

## unique id - EDIT HERE! MUST BE UNIQUE FROM ALL OTHER GAMES IN THE SAME TOURNAMENT!
scoreboard players set id GAMENAME.config 1

## gamestate - EDIT HERE! add more states as necessary. do not change init and lobby
scoreboard players set state.init GAMENAME.config -1
scoreboard players set state.lobby GAMENAME.config 0
scoreboard players set state.pregame GAMENAME.config 1
scoreboard players set state.ingame GAMENAME.config 2
scoreboard players set state.postgame GAMENAME.config 3



## GAMENAME.timer
scoreboard players set time.lobby GAMENAME.config 3600
scoreboard players set time.pregame GAMENAME.config 
scoreboard players set time.ingame GAMENAME.config 
scoreboard players set time.postgame GAMENAME.config 

### bossbar
bossbar add gamename:timer ""
bossbar set gamename:timer visible false

### Initialize teams
#team add ...