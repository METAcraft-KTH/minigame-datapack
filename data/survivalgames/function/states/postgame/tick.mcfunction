## POSTGAME: The game has ended, and players will be teleported back soon.

# manage rejoin etc (you should prob not be able to die in this phase)
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function survivalgames:states/postgame/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function survivalgames:states/postgame/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function survivalgames:states/postgame/respawn

# increment timer
scoreboard players add ?timer SURVIVALGAMES.game 1
execute if score round SURVIVALGAMES.game < round_count SURVIVALGAMES.config run function survivalgames:states/postgame/display_timer {text: "Next round starts in"}
execute if score round SURVIVALGAMES.game >= round_count SURVIVALGAMES.config run function survivalgames:states/postgame/display_timer {text: "Returning to lobby in"}

## return to lobby

execute if score ?timer SURVIVALGAMES.game >= time.postgame SURVIVALGAMES.config if score round SURVIVALGAMES.game >= round_count SURVIVALGAMES.config run function survivalgames:exit
execute if score ?timer SURVIVALGAMES.game >= time.postgame SURVIVALGAMES.config if score round SURVIVALGAMES.game < round_count SURVIVALGAMES.config run function survivalgames:states/pregame/start
