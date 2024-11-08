# This state is not used, since we jump from lobby straight into the game.
#scoreboard players set ?state tnttag.game 1

# various configs
function tnttag:states/pregame/configure_gamerule

# call game start
function tnttag:states/ingame_tag/start